export ZSH="$HOME/.oh-my-zsh"
export VISUAL="nvim"
export EDITOR="nvim"
export SHELL="zsh"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh
# source ~/.bin/tmuxinator.zsh

## git
export REVIEW_BASE="master"

# Ruby
eval "$(rbenv init -)" #init rbnenv for ruby

# Vim
alias vim=/usr/local/bin/nvim

# tmux
alias mux='tmuxinator'

# Make aliases
alias mjr='make jerry-run'
alias mjrs='make jerry-replserver'
alias mt='make test'

# Yarn Aliases
alias ys='yarn serve'
alias yd='yarn dist'
alias ye='yarn export'

# project jumping
alias eqj='cd ~/code/gitlab/equalture/components/jerry'
alias eq='cd ~/code/gitlab/equalture/'

# git aliases
alias gf='git fetch --prune'
alias gs='git status -sb'
alias glo='git log --oneline'
alias gl='git log'
alias gpd='git pull'
alias gpo='git push origin'

# docker
alias dlsc='docker container ls -a' # -a because I want to see ALL
alias dlsi='docker images -a' # -a because I want to see ALL
alias dps='docker ps'
alias dcud='docker-compose up -d'

# #Aliases for ls
alias ll='ls -lh'
alias l='ls -lhA'
alias lsa='ls -a'
alias rm='rm -i'
## NVM
# export NVM_DIR=~/.nvm
#source $(brew --prefix nvm)/nvm.sh

## python
#alias python="/usr/local/bin/python3"

## Fixes fzf searching in git ignored files and folders
# export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# export TYPEWRITTEN_MULTILINE=false
# export TYPEWRITTEN_CURSOR="underscore"
autoload -U promptinit; promptinit
prompt pure

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

[[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"
export PATH=$PATH:"$HOME/.kiex/elixirs/elixir-1.8.2/bin":$HOME/.kerl/21.3/bin #"$HOME/usr/local/lib/ruby/gems/2.7.0/bin"