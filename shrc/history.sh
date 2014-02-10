alias h='history'
alias clearh='cat /dev/null > ~/.bash_history'

# Increase history size
export HISTSIZE=3000
export HISTFILESIZE=6000

# Disable history for `less`
export LESSHISTFILE=/dev/null

# Append to the history file when exiting instead of overwriting it
shopt -s histappend

# Ignore consecutive duplicates and ignore spaces
# Ideally, history should ignore consecutive dups using ignoredups and typing
# `h` should call a function to clean history by erasing any existing dups
export HISTCONTROL=ignoredups:ignorespace

# Make history more useful by ignoring short commands and aliases which don't
# typically require options or commands

# Editors
HISTIGNORE="e:v:sb:$HISTIGNORE"

# Git
HISTIGNORE="g:gaa:gb:gba:gc:gca:gcaa:gcam:gci:gco:gd:gg:ggg:gl:gp:gst:$HISTIGNORE"

# JS
HISTIGNORE="gr:grw:n:ni:no:$HISTIGNORE"

# Navigation
HISTIGNORE=".:..:...:bin:c:cd:cod:d:dev:dot:etc:h:l:ll:lll:lap:ls:lsd:lsf:lsl:lt:lts:opt:p:rcd:rt:sbin:site:ubin:usbin:usr:var:vimf:$HISTIGNORE"

# Ruby
HISTIGNORE="irb:pry:b:f:migrate:m:rk:s:t:$HISTIGNORE"

# System
HISTIGNORE="r:$HISTIGNORE"

# Util
HISTIGNORE="et:tags:tm:$HISTIGNORE"

# bin, sbin
HISTIGNORE="bash:bc:cal:date:df:du:j:pwd:tree:who:whoami:$HISTIGNORE"

# ~/bin
HISTIGNORE="fs:tre:wifi:$HISTIGNORE"

export HISTIGNORE
