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

# pnpm
export PNPM_HOME="/Users/ndys/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Python
export PATH=$PATH:/Users/ndys/Library/Python/3.9/bin
eval "$(pyenv init -)"

# gcloud needs Python 3.10-3.14, not the system 3.9
export CLOUDSDK_PYTHON=/opt/homebrew/bin/python3.11

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
hs_gpa() {
  local current_branch
  current_branch=$(git branch --show-current)

  git fetch --all --prune || return 1

  for remote in $(git branch -r | grep '^ *origin/' | grep -v 'origin/HEAD'); do
    remote=$(echo "$remote" | xargs)
    local branch=${remote#origin/}

    if git show-ref --verify --quiet "refs/heads/$branch"; then
      git switch "$branch"
    else
      git switch -c "$branch" --track "$remote"
    fi

    git pull --ff-only
  done

  git switch "$current_branch"
}

. "$HOME/.local/bin/env"

# Hermes Agent — ensure ~/.local/bin is on PATH
export PATH="$HOME/.local/bin:$PATH"

# Qwen Code PATH block begin
export PATH='/Users/ndys/.local/bin':$PATH
# Qwen Code PATH block end


# Added by Antigravity CLI installer
export PATH="/Users/ndys/.local/bin:$PATH"
