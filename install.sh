#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

info() { printf '\033[0;34m%s\033[0m\n' "$1"; }
ok()   { printf '\033[0;32m%s\033[0m\n' "$1"; }

link() {
    local src="$1" dst="$2"
    mkdir -p "$(dirname "$dst")"
    if [ -L "$dst" ]; then
        rm "$dst"
    elif [ -e "$dst" ]; then
        mv "$dst" "$dst.bak"
        info "Backed up $dst → $dst.bak"
    fi
    ln -s "$src" "$dst"
    ok "Linked $dst → $src"
}

# --- Fish ---
link "$DOTFILES/fish/config.fish"   "$HOME/.config/fish/config.fish"
link "$DOTFILES/fish/fish_plugins"  "$HOME/.config/fish/fish_plugins"

# --- Helix ---
link "$DOTFILES/helix/config.toml"  "$HOME/.config/helix/config.toml"

# --- Git ---
link "$DOTFILES/git/gitconfig"        "$HOME/.gitconfig"
link "$DOTFILES/git/gitignore_global" "$HOME/.gitignore_global"

# --- VS Code ---
if [ "$(uname)" = "Darwin" ]; then
    link "$DOTFILES/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
    # Install Gruvbox extension if code CLI is available
    if command -v code > /dev/null; then
        info "Installing VS Code Gruvbox extension..."
        code --install-extension jdinhlife.gruvbox 2>/dev/null || true
    fi
fi

# --- iTerm2 ---
if [ "$(uname)" = "Darwin" ]; then
    info "To import iTerm2 colors: open $DOTFILES/iterm2/gruvbox_dark_hard.itermcolors"
    info "Then set it as default in iTerm2 → Preferences → Profiles → Colors → Color Presets"
fi

echo ""
ok "Done! Restart your shell to pick up changes."
