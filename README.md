# My personal dotfiles

Personal macOS development environment setup and configuration files.

Contains installation scripts for development tools, shell aliases, functions, and application settings.

## Installation

Clone this repository as `.dotfiles` in your home directory and run the bootstrap script:

```bash
git clone <your-repo-url> .dotfiles
cd .dotfiles
./bootstrap
```

## Usage

Run the bootstrap script to install or update:

```bash
./bootstrap
```

## Structure

- `shell/` - Shell configuration, aliases, and functions
- `nvim/` - Neovim configuration
- `kitty/` - Kitty terminal configuration  
- `gh/` - GitHub CLI configuration
- `macos/` - macOS system defaults
- `.tmux.conf` - Tmux terminal multiplexer configuration

---

*Thanks to [Freek Van der Herten](https://github.com/freekmurze/dotfiles) for the original structure and inspiration.*
