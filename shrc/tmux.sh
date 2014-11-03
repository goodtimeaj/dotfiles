alias tma='tmux attach'
alias tmi='tmux info | less -iFNQRX'
# Set the current tmux window name to the cwd basename
alias tmw='tmux rename-window "$(basename "$(pwd)")"'

tmux_has_session() {
  tmux has-session -t "$1" 2>/dev/null
}

# Starts a new tmux session with the cwd basename, `tmux` otherwise
tm() {
  if [ $# -eq 0 ]; then
    local cwd_basename="$(basename "$(pwd)")"
    local session_name_target="$cwd_basename"

    # Set the session name to the repo name when within a git repo
    local git_working_dir="$(git rev-parse --show-toplevel)"
    if [ $git_working_dir ]; then
      session_name_target="$(basename "$git_working_dir")"
    fi

    # Try $cwd_basename + "-\d" until an unused session name is found

    local has_session=0
    if $(tmux_has_session "$session_name_target"); then
      has_session=1
    else
      has_session=0
    fi

    local count=1
    local session_name_test="$session_name_target"
    while [ "$has_session" ]; do
      $(tmux_has_session "$session_name_test") || break
      session_name_test="${session_name_target}-${count}"
      count=$(( count + 1 ))
    done

    tmux new-session -s "$session_name_test" -n "$cwd_basename"
  else
    tmux "$@"
  fi
}
