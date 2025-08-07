# My personal dotfiles

Personal macOS development environment setup and configuration files.

Contains installation scripts for development tools, shell aliases, functions, and application settings. Configuration backups are managed via [Mackup](https://github.com/lra/mackup).

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

- `aliases/` - Shell aliases and shortcuts
- `functions/` - Custom shell functions
- `install/` - Installation scripts for various tools
- `mackup/` - Mackup configuration and backup settings

---

*Thanks to [Freek Van der Herten](https://github.com/freekmurze/dotfiles) for the original structure and inspiration.*
