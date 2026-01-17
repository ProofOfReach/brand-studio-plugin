#!/bin/bash
set -e

PLUGIN_DIR="$HOME/.claude/plugins/brand-studio"
SETTINGS_FILE="$HOME/.claude/settings.json"

echo "Installing Brand Studio plugin..."

# Clone or update
if [ -d "$PLUGIN_DIR" ]; then
  echo "Updating existing installation..."
  cd "$PLUGIN_DIR" && git pull
else
  echo "Cloning plugin..."
  mkdir -p "$HOME/.claude/plugins"
  git clone https://github.com/ProofOfReach/brand-studio-plugin.git "$PLUGIN_DIR"
fi

# Add to settings.json if not already there
if [ -f "$SETTINGS_FILE" ]; then
  if grep -q "brand-studio" "$SETTINGS_FILE"; then
    echo "Plugin already configured in settings.json"
  else
    echo "Adding plugin to settings.json..."
    # Use a temp file for safe editing
    tmp=$(mktemp)
    if command -v jq &> /dev/null; then
      jq '.pluginDirs = (.pluginDirs // []) + ["~/.claude/plugins/brand-studio"] | .pluginDirs |= unique' "$SETTINGS_FILE" > "$tmp" && mv "$tmp" "$SETTINGS_FILE"
    else
      echo "Warning: jq not installed. Please manually add to $SETTINGS_FILE:"
      echo '  "pluginDirs": ["~/.claude/plugins/brand-studio"]'
    fi
  fi
else
  echo "Creating settings.json..."
  mkdir -p "$HOME/.claude"
  echo '{"pluginDirs": ["~/.claude/plugins/brand-studio"]}' > "$SETTINGS_FILE"
fi

echo ""
echo "Brand Studio installed successfully!"
echo ""
echo "Available commands:"
echo "  /copy        - Generate marketing copy"
echo "  /headline    - Create headline variations"
echo "  /design      - Create visual concepts"
echo "  /brand-kit   - Build complete brand guidelines"
echo ""
echo "Run 'claude' to start using Brand Studio."
