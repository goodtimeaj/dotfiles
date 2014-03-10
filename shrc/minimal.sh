# A minimal set of safe bash configurations for any box

# Git
###############################################################################

# `git status` if no arguments, `git` otherwise
g() {
  if [ $# -eq 0 ]; then
    git status -sb
  else
    git "$@"
  fi
}

# History
###############################################################################

alias h='history'

HISTIGNORE=".:c:e:et:g:h:l:ll:r:$HISTIGNORE"
export HISTIGNORE

# Manipulation
###############################################################################

alias cpr='cp -Rvi'
alias lns='ln -sfvn'
alias mkd='mkdir -pv'
alias rmf='rm -rfv'
alias to='touch'

# Navigation
###############################################################################

# Detect which `ls` color option is in use
if ls --color >/dev/null 2>&1; then
  ls_color_option='--color'
else
  ls_color_option='-G'
fi

# cd's into a directory and then lists it
c() {
  if [ $# -eq 0 ]; then
    cd $HOME && ls -lah ${ls_color_option}
  else
    cd "$1" && ls -lah ${ls_color_option}
  fi
}

alias dot='c ~/dotfiles'
alias l="ls -lah ${ls_color_option}"
alias ll="ls -A ${ls_color_option}"
alias lt="ls -A ${ls_color_option} | less -iFNQRX"
alias show='ls -lah ${ls_color_option} | /usr/bin/grep -ni --color=auto'
alias vimf='c ~/vimfiles'

# `.` with no arguments traverses up directory
function .() {
  if [ $# -eq 0 ]; then
    cd ..
  else
    . "$@"
  fi
}

# Greps a long list of the current directory for the given name
show() {
  ls -lh |
  \grep -Eni "[0-9]{2}:[0-9]{2}[ \t].*$@.*$" |
  \grep -i --color=auto "$@"
}

# Tree with dotfiles, color, ignoring certain files, options, directories
# first, piped into less with line numbers and preserving color, unless the
# output is small enough for one screen
tre() {
  tree -aC -I '.git' --dirsfirst "$@" | less -iFNQRX
}

# Show directory listing for the working executable followed by all paths
wch() {
  local res=$(which "$@")
  if [ -n "$res" ]; then
    ls -lah ${ls_color_option} "$res"
    which -a "$@"
  else
    echo "\`$@\` not found"
  fi
}

# Search
###############################################################################

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# System
###############################################################################

alias et='exit'
alias r="exec $SHELL -l"

# Path
###############################################################################

# Print `$PATH` on multiple lines
alias path='echo -e ${PATH//:/\\n}'
