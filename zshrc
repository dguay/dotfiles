# Path to dotfiles directory.
export DOTFILES=$HOME/.dotfiles

# Initialize zplug.
source ~/.zplug/init.zsh

# Initialize aliases
source ~/.aliases

# 256 colors terminal
export TERM="xterm-256color"

#############################################################
# Env
#############################################################
if [[ -e /usr/libexec/java_home ]]; then
  export JAVA_HOME=`/usr/libexec/java_home`
fi

# export JAVA_TOOL_OPTIONS='-Djava.awt.headless=true'

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# NODE_PATH
export NODE_PATH=$NODE_PATH:`npm root -g`

#############################################################
# Plugins
#############################################################

# Themes
# zplug "sindresorhus/pure", as:theme, use:"*.zsh"
zplug "denysdovhan/spaceship-zsh-theme", use:spaceship.zsh, from:github, as:theme

# SPACESHIP Theme
SPACESHIP_PROMPT_ORDER=(user host dir git hg exec_time line_sep jobs char)
# SPACESHIP_CHAR_SYMBOL="➜  " 
SPACESHIP_CHAR_SYMBOL="❯ " 
SPACESHIP_EXEC_TIME_PREFIX=""
#SPACESHIP_PROMPT_ADD_NEWLINE=false
#SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_DIR_COLOR="012"
# GIT
# Disable git symbol
SPACESHIP_GIT_SYMBOL="" # disable git prefix
SPACESHIP_GIT_BRANCH_PREFIX="" # disable branch prefix too
# Wrap git in `git:(...)`
SPACESHIP_GIT_PREFIX='git:('
SPACESHIP_GIT_SUFFIX=") "
SPACESHIP_GIT_BRANCH_SUFFIX="" # remove space after branch name
# Unwrap git status from `[...]`
SPACESHIP_GIT_STATUS_PREFIX=""
SPACESHIP_GIT_STATUS_SUFFIX=""
# Branch color
SPACESHIP_GIT_BRANCH_COLOR=magenta

# Bullet-train theme
#setopt prompt_subst # Make sure prompt is able to be generated properly.
#zplug "caiogondim/bullet-train.zsh", use:bullet-train.zsh-theme, defer:3 # defer until other plugins like oh-my-zsh is loaded

# PLUGINS 
zplug "lib/completion", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug "lib/spectrum", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh, ignore:oh-my-zsh.sh
zplug "plugins/command-not-found", from:oh-my-zsh, ignore:oh-my-zsh.sh
zplug 'djui/alias-tips'
# zplug "zsh-users/zsh-syntax-highlighting", defer:3
zplug "zdharma/fast-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "iam4x/zsh-iterm-touchbar"
zplug "jimeh/zsh-peco-history", defer:2

# Check for uninstalled plugins.
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Source plugins.
zplug load 
