if [ "$(uname -s)" = "FreeBSD" ] || [ "$(uname -s)" = "Darwin" ]; then

  # Colors for BSD `ls` with -G flag
  export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
elif [ "$(uname -s)" = "Linux" ]; then
  export LS_COLORS="di=1;36:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"

  # eval `dircolors "${HOME}/.dircolors"`
fi
