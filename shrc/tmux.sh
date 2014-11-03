alias tma='tmux attach'
alias tmi='tmux info | less -iFNQRX'

# Start a new tmux session with the cwd basename, `tmux` otherwise
tm() {
  if [ $# -eq 0 ]; then
    local cwd_basename="$(basename "$(pwd)")"
    tmux new-session -s "$cwd_basename" -n "$cwd_basename"
  else
    tmux "$@"
  fi
}
