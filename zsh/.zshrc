export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Theme to load (see https://github.com/ohmyzsh/ohmyzsh/wiki/Themes)
ZSH_THEME="robbyrussell"

# Plugins to load (standard and custom plugins)
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Set preferred editors
export EDITOR="nvim"
export VISUAL="nvim"

# Java setup
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH

# PostgreSQL binaries and data directory
export PATH="/usr/lib/postgresql/17/bin:$PATH"
export PGDATA=/etc/postgresql/17/main

# Node Version Manager (NVM) setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"       
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  

# SDKMAN setup - must be at the end for SDKMAN to work
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# Tmuxifier setup
export TMUXIFIER_PATH="$HOME/.tmuxifier"
export PATH="$TMUXIFIER_PATH/bin:$PATH"
eval "$(tmuxifier init -)"

# Add composer vendor binaries to PATH
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

# Aliases
alias ls="colorls"

# History file location
export HISTFILE="$HOME/.zsh_history"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin
