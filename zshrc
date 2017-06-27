# Path to dotfiles directory.
export DOTFILES=$HOME/.dotfiles

# Initialize zplug.
source ~/.zplug/init.zsh

#############################################################
# Plugin
#############################################################

# Themes
# zplug "dracula/zsh", use:dracula.zsh-theme
# zplug "sindresorhus/pure", as:theme, use:"*.zsh"
zplug "denysdovhan/spaceship-zsh-theme", use:spaceship.zsh, from:github, as:theme

# oh-my-zsh plugins
zplug "lib/completion", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug 'lib/key-bindings', from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/mercurial", from:oh-my-zsh


# Reminds you of aliases you have already.
zplug 'djui/alias-tips'

zplug "supercrabtree/k"


# Check for uninstalled plugins.
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Source plugins.
zplug load --verbose
