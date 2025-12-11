#!/bin/bash
# .devcontainer/update-workspace-owner.sh
# Normalize ownership of bind mounts and volumes so the vscode user can write to them.
# This runs as root from devcontainer postStart to avoid permission surprises on Windows mounts.
set -euo pipefail

if [ "$(id -u)" -ne 0 ]; then
    echo "WARN: ownership update skipped because caller is not root"
    exit 0
fi

# Determine the non-root user we should normalize ownership for.
# SUDO_USER is set when invoked via sudo; fall back to the current user.
current_user="${SUDO_USER:-$(id -un)}"
if ! id -u "${current_user}" >/dev/null 2>&1; then
    echo "User ${current_user} does not exist; skipping ownership update"
    exit 0
fi

update_owner_if_needed() {
    target_dir=${1}; shift
    if [ ! -d "${target_dir}" ]; then
        return 0
    fi
    current_owner=$(ls -ld "${target_dir}" | awk '{print $3}')
    if [[ "${current_owner}" == "${current_user}" ]]; then
        echo "OK: ${target_dir} owner is as expected (${current_user})"
        return 0
    fi
    echo "CHOWN: changing ${target_dir} owner from ${current_owner} to ${current_user}"
    if chown -R "${current_user}:${current_user}" "${target_dir}"; then
        echo "DONE: ownership updated for ${target_dir}"
    else
        echo "WARN: failed to change owner for ${target_dir}; continuing without error"
    fi
}

for target_dir in "/commandhistory" "$(eval echo ~${current_user})/.codex" "/workspaces"; do
    update_owner_if_needed "${target_dir}"
done
