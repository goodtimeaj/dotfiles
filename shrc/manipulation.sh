alias chgrp='chgrp -v'
# Show old and new modes on update
alias chmod='chmod -vv'
alias chown='chown -v'
# Prompt before overwriting
alias cp='cp -vi'
alias cpr='cp -Rvi'
alias ln='ln -v'
# Most common options for symbolic links
alias lns='ln -sfvn'
alias mkd='mkdir -pv'
# Prompt before overwriting
alias mv='mv -vi'
alias rm='rm -v'
alias rmf='rm -rfv'
alias to='touch'

# Create a new directory and enter it
mcd() {
  mkdir -pv "$@" && cd "$@"
}

# Remove the current directory and traverse to the enclosing directory
rcd() {
  local dir_to_remove="$(pwd)"
  cd .. && rm -rfv "$dir_to_remove"
  echo
  c .
}
