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
alias ca='less -iFNQRX'
alias cod='c ~/code'
alias d='c ~/dropbox'
alias dev='c /dev "$short_list_options"'
alias dot='c ~/dotfiles'
alias dotinstall="cd ~/dotfiles && ./install.sh && exec $SHELL -l"
alias etc='c /etc "$short_list_options"'
alias lap='c ~/laptop'
# l and ll are reversed for readability
alias l="ls ${long_list_options}"
alias ll="ls ${short_list_options}"
# Finger slippage
alias lll='ll'
alias log='c /var/log'
# Long list in less
alias lt="ls -p ${long_list_options} | less -iFNQRX"
# Short list in less
alias lts="ls -pC ${short_list_options} | less -iFQRX"
# List only directories
alias lsd="ls ${long_list_options} | \grep --color=never '^d'"
# List only files
alias lsf="ls ${long_list_options} | \grep --color=never '^-'"
# List only links
alias lsl="ls ${long_list_options} | \grep --color=never '^l'"
# List reverse by time
alias lst="ls -lAhtr ${ls_color_option}"
# List reverse by size
alias lss="ls -lAhSr ${ls_color_option}"
alias not='c ~/notes'
alias opt='c /opt'
alias p='c ~/p'
alias proc='c /proc'
alias rt='c /'
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

# Shows directory listing for the working executable followed by all paths
wch() {
  local res=$(which "$@")
  if [ -n "$res" ]; then
    ls -lh ${ls_color_option} "$res"
    which -a "$@"
  else
    echo "\`$@\` not found"
  fi
}

# Make `less` more friendly for non-text input files using `lesspipe`
# if hash lesspipe 2>/dev/null; then
#   eval "$(SHELL=/bin/sh lesspipe)"
# fi
