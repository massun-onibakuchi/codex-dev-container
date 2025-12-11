#!/bin/bash
# examples/test_codex_whitelist.sh
# Sanity-check the proxy whitelist so Codex can reach OpenAI while Anthropic endpoints stay blocked.

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WHITELIST="${ROOT_DIR}/.devcontainer/proxy/whitelist.txt"

if ! grep -Fxq "api.openai.com" "${WHITELIST}"; then
    echo "missing api.openai.com in whitelist" >&2
    exit 1
fi

if ! grep -Fxq "platform.openai.com" "${WHITELIST}"; then
    echo "missing platform.openai.com in whitelist" >&2
    exit 1
fi

if grep -Fxq "api.anthropic.com" "${WHITELIST}"; then
    echo "anthropic domain should not be whitelisted for Codex setup" >&2
    exit 1
fi
