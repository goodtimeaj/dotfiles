alias h='history'
alias clearh='cat /dev/null > ~/.bash_history && history -c'

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
HISTIGNORE="g:gaa:gb:gba:gc:gca:gcaa:gcam:gci:gco:gd:gg:ggg:git:gl:gp:gst:$HISTIGNORE"

# JS
HISTIGNORE="gr:grw:n:ni:no:$HISTIGNORE"

# Navigation
HISTIGNORE=".:..:...:-:bin:c:cd:cod:d:dot:etc:h:l:ll:lll:lap:log:ls:lsd:lsf:lsl:lt:lts:opt:p:rcd:rt:sbin:site:ubin:usbin:usr:var:vimf:$HISTIGNORE"

# OSX
HISTIGNORE="lk:thumb:screenshots:$HISTIGNORE"

# Ruby
HISTIGNORE="irb:pry:b:f:migrate:m:rk:s:t:$HISTIGNORE"

# System
HISTIGNORE="et:exit:path:r:$HISTIGNORE"

# Util
HISTIGNORE="tags:tm:tmi:$HISTIGNORE"

# bin, sbin
HISTIGNORE="bash:bc:cal:date:df:du:j:pwd:tree:who:whoami:$HISTIGNORE"

# ~/bin
HISTIGNORE="fs:tre:wifi:$HISTIGNORE"

export HISTIGNORE
