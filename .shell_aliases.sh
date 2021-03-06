alias ciscovpn=/opt/cisco/anyconnect/bin/vpnui
alias tmux="TERM=screen-256color-bce tmux"

if command -v nvim >/dev/null 2>&1; then
	alias vim="nvim"
fi

alias gitb="git branch"
alias gbvv="git branch -vv"
alias gs="git status"
alias gc="git checkout"
alias glog="git log --graph --decorate"

alias mv='mv -n'    # Dont move if file of same name exists
alias ls='ls -G'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls set wildmode=list:longest,full-CF'

alias stat='stat -x'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias cdgit='cd ~/Documents/git'
