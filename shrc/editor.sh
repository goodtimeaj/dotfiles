export EDITOR=vim
export VISUAL=mvim
export GIT_EDITOR=$EDITOR
export GEM_EDITOR=$EDITOR
export LESSEDIT=$EDITOR

# Set Vim as the man page viewer
export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
  vim -R -c 'set ft=man nomod' -c 'map q :q!<CR>' \
  -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

# `e` with no arguments opens $EDITOR with the current directory
e() {
  if [ $# -eq 0 ]; then
    $EDITOR .
  else
    $EDITOR "$@"
  fi
}

# `v` with no arguments opens $VISUAL with the current directory
v() {
  if [ $# -eq 0 ]; then
    $VISUAL .
  else
    $VISUAL "$@"
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
