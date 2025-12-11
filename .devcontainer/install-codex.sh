#!/bin/bash
# .devcontainer/install-codex.sh
# Install the Codex CLI inside the dev container so the codex command is always available.
# Uses the npm package @openai/codex because the container image only supplies Node.js.

set -euo pipefail

if ! command -v codex >/dev/null 2>&1; then
    npm install -g @openai/codex
fi
