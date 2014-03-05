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
alias mk='mkd'
# Prompt before overwriting
alias mv='mv -vi'
alias rm='rm -v'
alias rmf='rm -rfv'
alias to='touch'

# Copy the current directory into the given directory
ccd() {
  local current_dir="$(pwd)"
  local target_dir=$(cd $(dirname "$1"); pwd)/$(basename "$1")
  cd .. && cp -Rvi "$current_dir" "$target_dir"
  echo
  c "$current_dir"
}

# Create a new directory and enter it
mkcd() {
  mkdir -pv "$@" && cd "$@"
}

# Move the current directory into the given directory
mvcd() {
  local current_dir="$(pwd)"
  local target_dir=$(cd $(dirname "$1"); pwd)/$(basename "$1")
  cd .. && mv -vi "$current_dir" "$target_dir"
  echo
  c "$target_dir"
}

# Remove the current directory and traverse to the enclosing directory
rcd() {
  local current_dir="$(pwd)"
  cd .. && rm -rfv "$current_dir"
  echo
  c .
}
