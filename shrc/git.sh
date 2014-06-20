preferred_git=git

if hash hub 2>/dev/null; then
  # Alias `hub` as `git`
  # eval "$(hub alias -s)"

  # Just set preferred git
  preferred_git=hub
fi

# Returns the current branch as a string
git_current_branch() {
  cat "$(git rev-parse --git-dir 2>/dev/null)/HEAD" | sed -e 's/^.*refs\/heads\///'
}

# `git status` if no arguments, `git` otherwise
g() {
  if [ $# -eq 0 ]; then
    git status -sb
  else
    git "$@"
  fi
}

alias ga='git add'

# `git add --all` preventing unintended arguments
gaa() {
  if [ $# = 0 ]; then
    git add --all :/
  fi
}

alias gap='git add --patch'
alias gau='git add --update'
alias gb='git branch -v'
alias gba='git branch -vv --all'
alias gc='git commit -v'
# Commit all changed files
alias gca='git commit -v --all'
# Commit all changed files including within uncached directories
alias gcaa='git add --all && git commit -v'
alias gcam='git commit --amend'
alias gch='git cherry-pick'
# alias gci='git pull --rebase && rake && git push'
alias gcl="${preferred_git} clone"

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

alias gcop='gco --patch'
alias gd='git diff --find-renames'
alias gdi='git diff --cached --find-renames'
alias gf='git fetch'
# Verbose `git status` since `g` is --short
alias gg='git status'
alias gin='git init'

# Creates a new git repo given a new directory name
git-new() {
  [ ! -d "$1" ] && mkdir "$1" &&
  cd "$1" &&
  git init &&
  touch .gitignore
}

alias glog='git log --date-order --pretty="format:%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset"'
alias gl='glog --graph'
alias gla='gl --all'
alias glo='git log --oneline'

# Greps committed text
gls() {
  query="$1"
  shift
  glog --pickaxe-regex "-S$query" "$@"
}

# Force ff-only - combined with no-ff for merge in gitconfig
alias gmf='git merge --ff-only'
alias gp='git push'
alias gpthis='gp origin $(git_current_branch)'
alias gs='git show'
alias gst='git stash'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show'
