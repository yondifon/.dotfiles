# Set editor
export EDITOR="nvim"
export VISUAL="nvim"

# Load environment variables from .env file
if [ -f ~/.dotfiles/.env ]; then
    set -a  # automatically export all variables
    source ~/.dotfiles/.env
    set +a  # disable automatic export
fi

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
plugins=(git docker composer macos)

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

# Dynamic tmux theme - detect if we're in Kitty
if [ -n "$KITTY_WINDOW_ID" ]; then
  # Detect system theme and set appropriate colors
  if [[ "$(defaults read -g AppleInterfaceStyle 2>/dev/null)" == "Dark" ]]; then
    # Dark theme colors (Catppuccin Mocha)
    BG_COLOR="#000011"
    FG_COLOR="#cdd6f4" 
    SUBTLE_COLOR="#585b70"
    ACTIVE_TAB_BG="#181825"  # Lighter for contrast in dark mode
  else
    # Light theme colors (Catppuccin Latte)  
    BG_COLOR="#eff1f5"
    FG_COLOR="#4c4f69"
    SUBTLE_COLOR="#6c6f85"
    ACTIVE_TAB_BG="#dce0e8"  # Darker for contrast in light mode
  fi
  
  # Set status bar colors using theme colors
  tmux set-option -g status-style "bg=$BG_COLOR,fg=$FG_COLOR"
  tmux set-option -g status-bg "$BG_COLOR"
  tmux set-option -g status-fg "$FG_COLOR"
  
  # Set window status colors to be subtle
  tmux set-window-option -g window-status-style "bg=$BG_COLOR,fg=$SUBTLE_COLOR"
  tmux set-window-option -g window-status-current-style "bg=$ACTIVE_TAB_BG,fg=$FG_COLOR"
  
  # Minimal window format
  tmux set-window-option -g window-status-format " #I:#W "
  tmux set-window-option -g window-status-current-format " #I:#W "
  tmux set-window-option -g window-status-separator ""
  
  # Set message colors
  tmux set-option -g message-style "bg=$BG_COLOR,fg=$FG_COLOR"
fi

# opencode
export PATH=/Users/malico/.opencode/bin:$PATH

# Added by Antigravity
export PATH="/Users/malico/.antigravity/antigravity/bin:$PATH"

export FLUTTER_HOME="/Users/malico/flutter"
export PATH="$FLUTTER_HOME/bin:$PATH"

export ANDROID_HOME="/Users/malico/Library/Android/sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
export PATH="$ANDROID_HOME/emulator:$PATH"
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"




# # Only run in interactive shells
# if [[ -o interactive ]]; then
#   if command -v bun >/dev/null 2>&1; then
#     # Run Bun update in background; log output so it doesn't clutter the prompt
#     nohup bun update --global >"${XDG_CACHE_HOME:-$HOME/.cache}/bun-update.log" 2>&1 &
#     disown
#   fi
# fi

