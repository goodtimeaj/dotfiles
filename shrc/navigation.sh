# Detect which `ls` color option is in use
if ls --color >/dev/null 2>&1; then
  ls_color_option='--color'
else
  ls_color_option='-G'
fi

# Default options for long and short `ls` formats 
export short_list_options="-A ${ls_color_option}"
export long_list_options="-lah ${ls_color_option}"

# cd's into a directory and then lists it `c [<dir>] [<options>]`
c() {
  if [ $# -eq 0 ]; then
    cd $HOME && ls ${long_list_options}
  elif [ $# -eq 1 ]; then
    cd "$1" && ls ${long_list_options}
  else
    cd "$1" && ls $(echo "$2")
  fi
}

alias ..='cd ..'
alias ...='cd ../..'
alias -- -='c -'
alias bin='c /bin'
alias cod='c ~/code'
alias d='c ~/dropbox'
alias dev='c /dev "$short_list_options"'
alias dot='c ~/dotfiles'
alias etc='c /etc "$short_list_options"'
alias lap='c ~/laptop'
# l and ll are reversed for readability
alias l="ls ${long_list_options}"
alias ll="ls ${short_list_options}"
# Finger slippage
alias lll='ll'
alias log='c /var/log'
# Display a long format list in less
alias lt="ls ${long_list_options} | less -iFNQRX"
# Display a short format list in less
alias lts="ls ${short_list_options} | less -iFNQRX"
# List only directories
alias lsd="ls ${long_list_options} | grep '^d'"
# List only files
alias lsf="ls ${long_list_options} | grep '^-'"
# List only links
alias lsl="ls ${long_list_options} | grep '^l'"
alias opt='c /opt'
alias p='c ~/p'
alias proc='c /proc'
alias rt='c /'
alias show='ls ${long_list_options} | grep'
alias sbin='c /sbin "$short_list_options"'
alias site='c ~/sites'
alias srv='c /srv'
alias tlf='tail -f'
alias tmp='c /tmp'
alias usr='c /usr'
alias ubin='c /usr/bin "$short_list_options"'
alias usbin='c /usr/sbin "$short_list_options"'
alias var='c /var'
alias vimf='c ~/vimfiles'

# `.` with no arguments traverses up directory
function .() {
  if [ $# -eq 0 ]; then
    cd ..
  else
    . "$@"
  fi
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

# Make `less` more friendly for non-text input files using `lesspipe`
# if hash lesspipe 2>/dev/null; then
#   eval "$(SHELL=/bin/sh lesspipe)"
# fi
