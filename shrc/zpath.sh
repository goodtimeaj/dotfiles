# Name this file `zpath` since `../shrc` paths are compiled in alphabetical
# order and some paths depend on exports set previously in `../shrc/*`.

# Print `$PATH` on multiple lines
alias path="echo -e ${PATH//:/\\n}"

PATH="/usr/local/sbin:${PATH}"
PATH="/usr/local/bin:${PATH}"

if [ -d "${RBENV_ROOT}" ]; then
  PATH="${RBENV_ROOT}/bin:${PATH}"
  eval "$(rbenv init -)"
fi

PATH="$HOME/bin:${PATH}"

export PATH
