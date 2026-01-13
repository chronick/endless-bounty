#!/bin/bash

# Farm to Table Theme - Local Installer
# Installs theme to VS Code and/or Cursor via symlink

THEME_DIR="$(cd "$(dirname "$0")" && pwd)"
THEME_NAME="farm-to-table-theme"

install_to_editor() {
    local editor_name="$1"
    local ext_dir="$2"

    if [[ -d "$ext_dir" ]]; then
        local target="$ext_dir/$THEME_NAME"

        if [[ -L "$target" ]]; then
            echo "✓ $editor_name: Already installed (symlink exists)"
        elif [[ -d "$target" ]]; then
            echo "⚠ $editor_name: Directory exists at $target - skipping"
        else
            ln -s "$THEME_DIR" "$target"
            echo "✓ $editor_name: Installed to $target"
        fi
    else
        echo "- $editor_name: Extensions folder not found, skipping"
    fi
}

echo "Installing Farm to Table theme..."
echo ""

# VS Code
install_to_editor "VS Code" "$HOME/.vscode/extensions"

# Cursor
install_to_editor "Cursor" "$HOME/.cursor/extensions"

echo ""
echo "Done! Restart your editor and press Cmd+K, Cmd+T to select the theme."
