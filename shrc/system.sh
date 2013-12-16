# Make disk space info human readable
alias df='df -H'

# Make disk usage info human readable
alias du='du -ch'

# Jobs show PID
alias j='jobs -l'

# Invoke current shell as login shell, essentially reloading
alias r="exec $SHELL -l"

# Restart
alias restart='sudo shutdown -r now'

# Top shows swap and purgeable memory
alias top='top -S'
