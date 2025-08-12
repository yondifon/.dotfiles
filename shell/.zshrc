# Set editor
export EDITOR="nvim"

# Load environment variables from .env file
if [ -f ~/.dotfiles/.env ]; then
    set -a  # automatically export all variables
    source ~/.dotfiles/.env
    set +a  # disable automatic export
fi

# Path to your oh-my-zsh configuration
export ZSH=$HOME/.oh-my-zsh

# Kitty integration
if [[ -n "$KITTY_INSTALLATION_DIR" ]]; then
  export KITTY_SHELL_INTEGRATION="enabled"
  autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
  kitty-integration
  unfunction kitty-integration
fi

# Use Pure prompt instead of agnoster
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

# Hide username in prompt
DEFAULT_USER=`whoami`

# Plugins
plugins=(git composer macos)

source $ZSH/oh-my-zsh.sh

# Load the shell dotfiles, and then some:
# * ~/.dotfiles-custom can be used for other settings you don’t want to commit.
for file in ~/.dotfiles/shell/.{exports,aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done

for file in ~/.dotfiles-custom/shell/.{exports,aliases,functions,zshrc}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

. $HOME/.dotfiles/shell/z.sh

# Import ssh keys in keychain
ssh-add -A 2>/dev/null;

# Setup xdebug
export XDEBUG_CONFIG="idekey=VSCODE"

# Path exports
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH=/usr/local/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"

# Laravel Herd configuration
export PATH="$HOME/Library/Application Support/Herd/bin:$PATH"
export NVM_DIR="/Users/malico/Library/Application Support/Herd/config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"

# Herd PHP configurations
export HERD_PHP_80_INI_SCAN_DIR="/Users/malico/Library/Application Support/Herd/config/php/80/"
export HERD_PHP_81_INI_SCAN_DIR="/Users/malico/Library/Application Support/Herd/config/php/81/"
export HERD_PHP_82_INI_SCAN_DIR="/Users/malico/Library/Application Support/Herd/config/php/82/"
export HERD_PHP_83_INI_SCAN_DIR="/Users/malico/Library/Application Support/Herd/config/php/83/"
export HERD_PHP_84_INI_SCAN_DIR="/Users/malico/Library/Application Support/Herd/config/php/84/"
export HERD_PHP_85_INI_SCAN_DIR="/Users/malico/Library/Application Support/Herd/config/php/85/"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "/Users/malico/.bun/_bun" ] && source "/Users/malico/.bun/_bun"

# pnpm
export PNPM_HOME="/Users/malico/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Docker CLI completions
fpath=(/Users/malico/.docker/completions $fpath)
autoload -Uz compinit
compinit

# Additional environment variables
export ACT_CACHE_AUTH_KEY=foo

# Sources for zsh enhancements
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
