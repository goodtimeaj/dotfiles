# Common options for `grep`, `fgrep`, `egrep`
export GREP_OPTIONS='--exclude-dir=.git --exclude-dir=*.cache --exclude-dir=.sass-cache --exclude-dir=node_modules --exclude-dir=bower_components --exclude=tags'

# Common grep options will affect interactive programs and not scripts or when
# `grep` is invoked via `\grep`
COMMON_GREP_OPTIONS='-nri --ignore-case --color=auto'
alias grep="grep ${COMMON_GREP_OPTIONS}"
alias egrep="egrep ${COMMON_GREP_OPTIONS}"
alias fgrep="fgrep ${COMMON_GREP_OPTIONS}"
