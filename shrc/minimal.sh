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

alias hist='history'

HISTIGNORE="c:e:g:h:l:ll:$HISTIGNORE"
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

alias ..='cd ..'
alias dot='c ~/dotfiles'
alias l="ls -lah ${ls_color_option}"
alias ll="ls -A ${ls_color_option}"
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


# System
###############################################################################

alias et='exit'
alias reload="exec $SHELL -l"


# Path
###############################################################################

# Print `$PATH` on multiple lines
alias path='echo -e ${PATH//:/\\n}'
