# preven logout
setopt IGNOREEOF

# colorize
autoload -Uz colors && colors

# colorize ls result
export LSCOLORS=cxfxcxdxbxegedabagacad
alias ll='ls -la'
alias ls='ls --color=auto'

# auto complete
autoload -Uz compinit && compinit

##########
# Git
##########

# git-prompt
source ~/.zsh/git-prompt.sh

# git-prompt options
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

setopt prompt_subst
PROMPT='%F{green}%n@%m%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f
\$ '

# aliases
alias g='git'
alias ga='git add'
alias gd='git diff'
alias gs='git status'
alias gp='git push'
alias gb='git branch'
alias gst='git status'
alias gco='git checkout'
alias gf='git fetch'
alias gc='git commit'
alias gl='git log --oneline'

alias dco='docker compose'

alias k='kubectl'
alias bb='kubectl run busybox --image=busybox:latest --rm -it --restart Never --command --'

alias c="cargo"

##########
# ENV
##########

export EDITOR="vim"

##########
# PATHs
##########
#
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
eval "$(gh completion -s zsh)"
export PATH="$PATH:$HOME/local/bin"

export GOPATH=$(go env GOPATH)
export PATH="$PATH:$(go env GOPATH)/bin"

source <(kubectl completion zsh)

source ~/.zshrc.local

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# vscode-workspace
alias vw="vscode-workspace"
source <(vscode-workspace completion zsh)