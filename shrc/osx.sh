# History
###############################################################################

HISTIGNORE="apps:appsh:bok:brews:dl:dsstore:dt:kf:lib:libh:lk:not:o:restart:trash:vol:$HISTIGNORE"
export HISTIGNORE

# Navigation
###############################################################################

alias apps='c /Applications'
alias appsh='c ~/Applications'
alias brews='c /usr/local/Cellar'
alias dl='c ~/Downloads'
alias dt='c ~/Desktop'
alias lib='c /Library "$short_list_options"'
alias libh='c ~/Library'
alias thumb='c "$("$HOME/bin/thumb" "$PWD")"'
alias updatedb='sudo /usr/libexec/locate.updatedb'
alias vol='c /Volumes'

# `o` with no arguments opens current directory
o() {
  if [ $# -eq 0 ]; then
    open .
  else
    open "$@"
  fi
}

# Prompt
###############################################################################

# Silence macOS bash deprecation warning
export BASH_SILENCE_DEPRECATION_WARNING=1

# System
###############################################################################

# Quit finder
alias killfinder="osascript -e 'tell application \"Finder\" to quit'"
alias kf='killfinder'

# Lock the screen
alias lk='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

# Delete all screenshots from the desktop
alias screenshots='rm ~/Desktop/Screen\ Shot*'
