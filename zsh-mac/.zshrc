# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Editor
export EDITOR="nvim"
export VISUAL="nvim"

# Java
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$JAVA_HOME/bin:$PATH

# Composer
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

# PostgreSQL
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# Tmuxifier
export PATH="$HOME/.tmuxifier/bin:$PATH"

# Better ls
alias ls="eza"
alias ll="eza -l"
alias la="eza -la"

# Better cat
alias cat="bat"

# Zoxide
eval "$(zoxide init zsh)"

# LazyGit
alias lg="lazygit"

