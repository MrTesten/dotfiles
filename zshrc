#
# Applications
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"  ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Source Base16
if [[ -s "$HOME/.config/base16-shell/base16-eighties.dark.sh" ]]; then
  source "$HOME/.config/base16-shell/base16-eighties.dark.sh"
fi

# Source Z jump-navigation
source ~/.zsh/z/z.sh

#
# Paths
#

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:$HOME/.rbenv/bin:$PATH"
export PATH=~/.chefdk:/opt/chefdk/bin:$PATH

# Initialize rbenv
eval "$(rbenv init -)"

#
# Language
#
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Editors
#
export EDITOR='vim'
# export VISUAL='nano'
export PAGER='less'

#
# Aliases
#
alias vim="mvim -v"
# alias vim="nvim"
alias vag="vagrant"
alias mamp-pro="sudo sh '/Applications/MAMP PRO/bin/start.sh'"
alias chat="sh ~/.scripts/bin/chat.sh"
alias commitary="sh ~/.scripts/bin/commitary.sh"
alias mcms="sh ~/.scripts/bin/mcms.sh"
alias pro-services="sh ~/.scripts/bin/pro-services.sh"

# Bundle
alias bi='bundle install'
alias be='bundle exec'

# Git
alias g='git'
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m' # requires you to type a commit message
alias gp='git push'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative'

# Tmux
alias ta='tmux attach -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'

# Postgres
alias pg='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'

# Redis
alias redis-start='redis-server /usr/local/etc/redis.conf'

# Pow
alias pow='touch ~/.pow/restart.txt'

#
# Settings
#
# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# enable extended globbing
setopt extended_glob

# passes the bad match onto the command, so we can HEAD^
setopt NO_NOMATCH

# reduce character sequence timeout from 400ms to 10ms
export KEYTIMEOUT=1
