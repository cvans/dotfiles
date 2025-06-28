#!/usr/bin/env bash
set -euo pipefail

PLUGINS_FILE="$(dirname "$0")/plugins.txt"

if [[ ! -f "$PLUGINS_FILE" ]]; then
  echo "Error: plugins file not found at $PLUGINS_FILE" >&2
  exit 1
fi

while IFS= read -r line; do
  # strip comments and whitespace
  plugin="${line%%#*}"
  plugin="${plugin#"${plugin%%[![:space:]]*}"}"
  plugin="${plugin%"${plugin##*[![:space:]]}"}"
  [[ -z "$plugin" ]] && continue

  # Check in `ya pkg list` for a line that starts (after indentation)
  # with the exact plugin name, followed by a space
  if ya pkg list | grep -qE "^[[:space:]]*${plugin}[[:space:]]"; then
    echo "✔ $plugin is already installed, skipping"
  else
    echo "Installing $plugin…"
    ya pkg add "$plugin"
  fi
done <"$PLUGINS_FILE"

echo "Upgrading all plugins…"
ya pkg upgrade
