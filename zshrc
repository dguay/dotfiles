# Path to dotfiles directory.
export DOTFILES=$HOME/.dotfiles

# Initialize zplug.
source ~/.zplug/init.zsh

# Initialize aliases
source ~/.aliases

# 256 colors terminal
export TERM="xterm-256color"

#############################################################
# Plugins
#############################################################

# Themes
# zplug 'dracula/zsh', as:theme
# zplug "sindresorhus/pure", as:theme, use:"*.zsh"
zplug "denysdovhan/spaceship-zsh-theme", use:spaceship.zsh, from:github, as:theme

# SPACESHIP Theme
SPACESHIP_PROMPT_SYMBOL=❯
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
#SPACESHIP_DIR_COLOR="$BG[081]"
SPACESHIP_DIR_COLOR="blue"

zplug "lib/completion", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug "lib/spectrum", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh, ignore:oh-my-zsh.sh
zplug "plugins/mercurial", from:oh-my-zsh, ignore:oh-my-zsh.sh
zplug "plugins/command-not-found", from:oh-my-zsh, ignore:oh-my-zsh.sh
zplug 'djui/alias-tips'
zplug "zsh-users/zsh-syntax-highlighting", defer:3
# zplug "zsh-users/zsh-autosuggestions"

# Check for uninstalled plugins.
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Source plugins.
zplug load 
