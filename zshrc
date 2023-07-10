# Path to dotfiles directory.
export DOTFILES=$HOME/.dotfiles

# Initialize zplug.
source ~/.zplug/init.zsh

# 256 colors terminal
export TERM="xterm-256color"

#############################################################
# Env
#############################################################
#if [[ -e /usr/libexec/java_home ]]; then
#  export JAVA_HOME=`/usr/libexec/java_home`
#fi

# NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# NODE_PATH
export NODE_PATH=$NODE_PATH:`npm root -g`

# BELL 
#disable ipv6 else the dns resolve time is 5 sec. IF THE NETWORK IS NOT Wi-Fi CHANGE IT FOR THE GOOD ONE
networksetup -setv6off Wi-Fi
 
#local run of maven requires local env setup
export ENV=local
export SPRING_PROFILES_ACTIVE=localdev
#export SPRING_PROFILES=localdev
 
# If you want the micro-services to run in low memory mode (recommended)
export LOW_MEMORY=TRUE
  
# Definition of the root directory for your tools on your working driver
export TOOL_PATH=$HOME/tools
# Definition of the root path of your projects on your working drive
export GIT_PROJECT_HOMES=$HOME/git
 
# All variables related to source code location
export BELL_EC_LF_SRC=$GIT_PROJECT_HOMES/bell-ec-liferay
export BELL_EWOC_DOCKER_SCRIPTS=$GIT_PROJECT_HOMES/docker-scripts
export BELL_DOCKER_SCRIPTS_V2=$BELL_EWOC_DOCKER_SCRIPTS/v2
export BELL_EC_DOCKER_SRC=$GIT_PROJECT_HOMES/docker-scripts
 
# Variables related to SSL certificates to be used by Maven and NPM
export MAVEN_OPTS="-Djavax.net.ssl.trustStore=$BELL_EWOC_DOCKER_SCRIPTS/cert/truststore.jks"
export NODE_EXTRA_CA_CERTS=$BELL_EWOC_DOCKER_SCRIPTS/cert/cacertsBellOnly.pem
 
#Java versions
export JAVA_8_VERSION=8.0.275.hs-adpt
export JAVA_11_VERSION=11.0.9.j9-adpt
 
# Proxy so that executables work correctly on ICN (Bell's network). Unset if you need to work locally out of the VPN without proxies.
export no_proxy="*.local, *.local,142.117.244.156, artifactory.it.ms.bell.ca, osdevconsole.belldev.dev.bce.ca, *.apps.enterprisecentre.ms.bell.ca, console.os.enterprisecentre.ms.bell.ca, 169.254/16, localhost, 127.0.0.1, 10.199.0.0/16, 10.198.0.0/16, 10.55.0.0/16, *.lab-services.ca, *.int.bellmobility.ca, vm1, 172.16.220.0/24, 10.194.20.0/24, 172.16.255.0/24, 192.168.56.0/24, *.yesbut.lab, 142.127.162.0/24, *.corp.bce.ca, *.dev.bce.ca, 142.117.73.0/24, 10.211.55.0/24, 142.122.0/24, 172.20.0.0/16, bl3c5h, *.ms.bell.ca, *.int.bell.ca, sslvpnqr.bell.ca, *.it.ms.bell.ca, *.exchange.bell.ca, 10.36.0.0/16, 192.168.0.0/24, git.enterprisecentre.ms.bell.ca, service-local"

export CI_REGISTRY=artifactory.vas.int.bell.ca:5000
export NPM_REGISTRY=https://artifactory.vas.int.bell.ca/api/npm/npm/
export PIP_FIND_LINKS=https://artifactory.vas.int.bell.ca/api/pypi/pip/simple
export PIP_INDEX_URL=https://artifactory.vas.int.bell.ca/api/pypi/pip/simple
export PIP_TRUSTED_HOST=artifactory.vas.int.bell.ca  
 
# If you are using a SSH Private Key (for SSH access or GitLav), It is recommended to copy your SSH Private Key to a secure local location. It must respect the private key format by being on multiple lines. In the example below, ti would be in ~/Dev/my_ssh_private_key
 
#export HTTP_PROXY=http://fastweb.int.bell.ca:8083
#export HTTPS_PROXY=http://fastweb.int.bell.ca:8083
#export http_proxy=http://fastweb.int.bell.ca:8083
#export https_proxy=http://fastweb.int.bell.ca:8083

#############################################################
# Initialize aliases
#############################################################

source ~/.aliases

#############################################################
# Plugins
#############################################################

# Themes
# zplug "sindresorhus/pure", as:theme, use:"*.zsh"
zplug "denysdovhan/spaceship-zsh-theme", use:spaceship.zsh, from:github, as:theme

# SPACESHIP Theme
SPACESHIP_PROMPT_ORDER=(user host dir git hg node exec_time line_sep jobs char)
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
zplug load --verbose

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/ez97548/.sdkman"
[[ -s "/Users/ez97548/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/ez97548/.sdkman/bin/sdkman-init.sh"
export PATH="/usr/local/sbin:$PATH"
