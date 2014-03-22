export EDITOR=vim
export VISUAL=vim
export GIT_EDITOR=$EDITOR
export GEM_EDITOR=$EDITOR
export LESSEDIT=$EDITOR

# Set Vim as the man page viewer
export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
  vim -R -c 'set ft=man nomod' -c 'map q :q!<CR>' \
  -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

# `e` with no arguments opens Vim with the current directory
e() {
  if [ $# -eq 0 ]; then
    vim .
  else
    if [ -w "$@" ]; then
      # File exists and is writable
      vim "$@"
    else
      if [ -e "$@" ]; then
        # File exists and is read-only
        sudo vim "$@"
      else
        # File does not exist yet
        vim "$@"
      fi
    fi
  fi
}

# `sb` with no arguments opens Sublime Text with the current directory
sb() {
  if [ $# -eq 0 ]; then
    subl .
  else
    subl "$@"
  fi
}
