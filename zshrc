# Path to dotfiles directory.
export DOTFILES=$HOME/.dotfiles

# Initialize zplug.
source ~/.zplug/init.zsh

# Initialize aliases
source ~/.aliases

# 256 colors terminal
export TERM="xterm-256color"

# PATH variable
export PATH=/usr/local/Cellar/qt/5.9.1/bin:$PATH
export PATH=/usr/local/Cellar/gcc@4.9:$PATH

#############################################################
# Env
#############################################################
if [[ -e /usr/libexec/java_home ]]; then
  export JAVA_HOME=`/usr/libexec/java_home`
fi

# export JAVA_TOOL_OPTIONS='-Djava.awt.headless=true'

# NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Maven
export MAVEN_MASTER_ACCESS_KEY=AKIAJCW2V4J5PT6WOCUQ
export MAVEN_MASTER_SECRET_KEY=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

#############################################################
# Plugins
#############################################################

# Themes
# zplug "sindresorhus/pure", as:theme, use:"*.zsh"
zplug "denysdovhan/spaceship-zsh-theme", use:spaceship.zsh, from:github, as:theme

# SPACESHIP Theme
SPACESHIP_PROMPT_ORDER=(user host dir hg git exec_time line_sep jobs char)
SPACESHIP_PROMPT_SYMBOL=❯
#SPACESHIP_PROMPT_ADD_NEWLINE=false
#SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_DIR_COLOR="012"

# Bullet-train theme
#setopt prompt_subst # Make sure prompt is able to be generated properly.
#zplug "caiogondim/bullet-train.zsh", use:bullet-train.zsh-theme, defer:3 # defer until other plugins like oh-my-zsh is loaded

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
zplug "zsh-users/zsh-autosuggestions"

# Check for uninstalled plugins.
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Source plugins.
zplug load 

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /Users/d.guay/code/lab/blockly-to-urscript/polysporin/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /Users/d.guay/code/lab/blockly-to-urscript/polysporin/node_modules/tabtab/.completions/electron-forge.zsh
