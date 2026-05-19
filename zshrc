# Path to dotfiles directory.
export DOTFILES="$HOME/.dotfiles"

# 256 colors terminal
export TERM="xterm-256color"

#############################################################
# Env
#############################################################

# NVM lazy loading
export NVM_DIR="$HOME/.nvm"

_lazy_load_nvm() {
  unset -f nvm node npm npx yarn pnpm corepack

  [ -s "$(brew --prefix nvm)/nvm.sh" ] && source "$(brew --prefix nvm)/nvm.sh"

  # Preserve your old NODE_PATH behavior, but only after nvm is loaded.
  export NODE_PATH="$(npm root -g 2>/dev/null)${NODE_PATH:+:$NODE_PATH}"

  "$@"
}

for cmd in nvm node npm npx yarn pnpm corepack; do
  eval "
    $cmd() {
      _lazy_load_nvm $cmd \"\$@\"
    }
  "
done

#############################################################
# Aliases
#############################################################

[ -f "$HOME/.aliases" ] && source "$HOME/.aliases"

#############################################################
# Theme
#############################################################

eval "$(starship init zsh)"

#############################################################
# Antidote
#############################################################

autoload -Uz compinit
compinit

source "$(brew --prefix)/opt/antidote/share/antidote/antidote.zsh"
antidote load "$HOME/.zsh_plugins.txt"

# accept autosuggestion with TAB (conflict with directory autocomplete)
#bindkey '^I' autosuggest-accept
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
