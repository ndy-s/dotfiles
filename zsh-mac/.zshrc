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
export PATH="/opt/homebrew/opt/postgresql@18/bin:$PATH"

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

# Antigravity
alias antigravity="open -a 'Antigravity IDE'"

# pnpm
export PNPM_HOME="/Users/ndys/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Python
export PATH=$PATH:/Users/ndys/Library/Python/3.9/bin
eval "$(pyenv init -)"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# bun completions
[ -s "/Users/ndys/.bun/_bun" ] && source "/Users/ndys/.bun/_bun"

# OpenClaw Completion
source "/Users/ndys/.openclaw/completions/openclaw.zsh"

# Added by Antigravity IDE
export PATH="/Users/ndys/.antigravity-ide/antigravity-ide/bin:$PATH"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/ndys/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions


# Automation scripts
function hs_gpa() {
  current_branch=$(git branch --show-current)

  git for-each-ref --format='%(refname:short)' refs/heads/ | while read branch; do
    git checkout "$branch" || continue
    git pull
  done

  git checkout "$current_branch"
}
