# Path to dotfiles directory.
export DOTFILES=$HOME/.dotfiles

# Initialize zplug.
source ~/.zplug/init.zsh

#############################################################
# Plugins
#############################################################

# Themes
# zplug 'dracula/zsh', as:theme
# zplug "sindresorhus/pure", as:theme, use:"*.zsh"
 zplug "denysdovhan/spaceship-zsh-theme", use:spaceship.zsh, from:github, as:theme

# oh-my-zsh plugins
zplug "lib/completion", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh, ignore:oh-my-zsh.sh
zplug "plugins/mercurial", from:oh-my-zsh, ignore:oh-my-zsh.sh
zplug "plugins/command-not-found", from:oh-my-zsh, ignore:oh-my-zsh.sh

# Reminds you of aliases you have already.
zplug 'djui/alias-tips'

zplug "zsh-users/zsh-syntax-highlighting", defer:3

# Check for uninstalled plugins.
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Source plugins.
zplug load 
