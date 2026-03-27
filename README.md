# dotfiles

Personal macOS configuration — Gruvbox Dark Hard everywhere.

## What's included

```
dotfiles/
├── fish/               # Fish shell
│   ├── config.fish     # Aliases, prompt, gruvbox colors, FZF, etc.
│   └── fish_plugins    # Fisher/OMF plugins
├── helix/              # Helix editor
│   └── config.toml     # Theme, editor settings
├── iterm2/             # iTerm2
│   └── gruvbox_dark_hard.itermcolors
├── git/                # Git
│   ├── gitconfig
│   └── gitignore_global
├── install.sh          # Symlink everything into place
└── README.md
```

## Setup

```bash
git clone git@github.com:<user>/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

## Theme

**Gruvbox Dark Hard** applied across:
- iTerm2 (colors)
- Fish shell (syntax highlighting)
- Helix editor

## Font

Noto Sans Mono, size 13
