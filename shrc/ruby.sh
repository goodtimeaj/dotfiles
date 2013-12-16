#
# Thanks:
# @thoughtbot
#

# `rbenv` root
export RBENV_ROOT="${HOME}/.rbenv"

# Ruby
alias rb='ruby'

# Bundler
alias b='bundle'
alias be='bundle exec'

# Tests and Specs
alias t='ruby -I test'

# RubyGems
alias gi='gem install'
alias giv='gem install -v'

# Rails
alias migrate='rake db:migrate && rake db:rollback && rake db:migrate && rake db:test:prepare'
alias mi='migrate'
alias rk='rake'
alias s='rspec'
alias z='zeus'

# `foreman start` if no arguments, `foreman` otherwise
f() {
  if [ $# -eq 0 ]; then
    foreman start
  else
    foreman "$@"
  fi
}

# "Coffee shop rails"
# Bind Rails server to localhost instead of all interfaces
crails() {
  if [ "$1" = s ] || [ "$1" = server ]; then
    shift
    set -- s -b 127.0.0.1 "$@"
  fi
  command rails "$@"
}
