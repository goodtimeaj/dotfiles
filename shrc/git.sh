preferred_git=git

if hash hub 2>/dev/null; then
  # Just set preferred git
  preferred_git=hub

  # Alias `hub` as `git`
  # eval "$(hub alias -s)"
fi

# Short with branches
alias ga='git add'
alias gaa='git add --all :/'
alias gb='git branch -v'
alias gba='git branch -v -a'
alias gc='git commit -v'
# Commit all changed files
alias gca='git commit -v -a'
# Commit all changed files including within uncached directories
alias gcaa='git add --all && git commit -v'
alias gcam='git commit --amend'
alias gci='git pull --rebase && rake && git push'
alias gcl="${preferred_git} clone"
alias gd='git diff'
alias gg='git log --oneline'
# Finger slippage
alias ggg='gg'
alias gl='git pull'
# Force ff-only - combined with no-ff for merge in gitconfig
alias gmf='git merge --ff-only'
alias gp='git push'
alias gst='git status'

# `git status` if no arguments, `git` otherwise
g() {
  if [ $# -eq 0 ]; then
    git status -sb
  else
    git "$@"
  fi
}

# `git checkout master` if no arguments
gco() {
  if [ $# -eq 0 ]; then
    git checkout master

    if [ $? -eq 1 ]; then 
      git checkout mainline
    fi
  else
    git checkout "$@"
  fi
}
