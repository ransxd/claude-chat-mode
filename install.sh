#!/usr/bin/env bash
# Install claude-chat-mode commands into ~/.claude/commands/
set -euo pipefail

CLAUDE_DIR="${HOME}/.claude"
COMMANDS_DIR="${CLAUDE_DIR}/commands"

mkdir -p "$COMMANDS_DIR"

cp commands/chat.md "$COMMANDS_DIR/chat.md"
cp commands/code.md "$COMMANDS_DIR/code.md"

echo "Installed /chat and /code commands to ${COMMANDS_DIR}/"
echo ""
echo "Usage:"
echo "  /chat         — switch to conversational mode"
echo "  /code         — switch back to coding mode"
echo "  /chat <msg>   — chat mode with an initial message"
echo ""
echo "Optional: copy CLAUDE.md.example to ${CLAUDE_DIR}/CLAUDE.md for adaptive mode auto-detection."
