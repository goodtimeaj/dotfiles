# vim:ft=sh:

# Load files in `$HOME/.shrc`
for file in "$HOME"/.shrc/*.sh; do
  source "$file"
done
unset file
