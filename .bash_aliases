alias ciscovpn=/opt/cisco/anyconnect/bin/vpnui
alias ssh-241="ssh scottk3@fa18-cs241-224.cs.illinois.edu"
alias ssh-vm="ssh -p 2222 vm@127.0.1.1"
alias mountVM="sshfs -p 2222 vm@127.0.1.1:/home/vm/Documents/git/scottk3 /home/cpu-642l/Documents/sshfs_mount"
alias cdvm="cd ~/Documents/sshfs_mount"
alias tmux="TERM=screen-256color-bce tmux"

alias gitb="git branch"
alias gbvv="git branch -vv"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias cdgit='cd ~/Documents/git'
alias spotify='/snap/bin/spotify --force-device-scale-factor=2 > /dev/null 2>&1 &'
