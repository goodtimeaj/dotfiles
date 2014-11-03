alias tma='tmux attach'
alias tmi='tmux info | less -iFNQRX'

tmux_has_session() {
  tmux has-session -t "$1" 2>/dev/null
}

# Starts a new tmux session with the cwd basename, `tmux` otherwise
tm() {
  if [ $# -eq 0 ]; then
    local cwd_basename="$(basename "$(pwd)")"

    # Try $cwd_basename + "-\d" until an unused session name is found

    local session_name_test="$cwd_basename"
    local has_session=0
    if $(tmux_has_session "$session_name_test"); then
      has_session=1
    else
      has_session=0
    fi

    local count=1
    while [ "$has_session" ]; do
      session_name_test="${cwd_basename}-${count}"
      count=$(( count + 1 ))
      $(tmux_has_session "$session_name_test") || break
    done

    tmux new-session -s "$session_name_test" -n "$session_name_test"
  else
    tmux "$@"
  fi
}
