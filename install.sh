#!/bin/bash
#
# Symlinks dotfiles to $HOME.

# Prints usage
usage() {
  cat << EOF
usage: $0 [-s|--submodules] [-h|--help]

OPTIONS:
  -s | --submodules    Initialize and update included git submodules
EOF
}

# Exits with given error message
die() {
  echo "$@"
  exit 1
}

# Minifies shell script files in place
minify_shell_script_file_in_place() {
  # 1. Convert tabs to spaces
  # 2. Remove blank lines
  # 3. Remove beginning spaces
  # 4. Remove whole line comments
  # 5. Remove trailing spaces

  # Set LANG as C to treat all ASCII characters as themselves and all
  # non-ASCII characters as literals
  env LANG=C sed 's/	/ /g' "$@" \
    | env LANG=C sed '/^$/d' \
    | env LANG=C sed 's/^[ ]*//' \
    | env LANG=C sed '/^[ ]*#/d' \
    | env LANG=C sed 's/[ ]*$//' \
    > tmp

  # Copy tmp to the given file and remove tmp
  cp tmp "$@"
  rm tmp
}

here=$(dirname "$0") && here=$(cd "$here" && pwd -P)

while :
do
  case "$1" in
    -h | --help )
      usage
      exit 0
      ;;
    -s | --submodules )
      cd "$here"
      echo "Initializing git submodules"
      (git submodule init && git submodule update) \
        || die "Could not update git submodules"
      shift
      ;;
    -- )
      shift
      break
      ;;
    -* )
      echo "Unknown option: $1"
      usage
      exit 1
      ;;
    * )
      break
      ;;
  esac
done

echo
echo "Linking files to \$HOME"

# Link all but the specified files to $HOME
for file in "${here}"/*; do
  filename="$(basename "$file")"
  target="${HOME}/.${filename}"

  if [ "$filename" != ".gitignore" ] &&
     [ "$filename" != ".gitmodules" ] &&
     [ "$filename" != "bash_profile" ] &&
     [ "$filename" != "bin" ] &&
     [ "$filename" != "bin-labs" ] &&
     [ "$filename" != "build" ] &&
     [ "$filename" != "install.sh" ] &&
     [ "$filename" != "lesskey" ] &&
     [ "$filename" != "LICENSE" ] &&
     [ "$filename" != "README.md" ] &&
     [ "$filename" != "shrc" ]; then
    ln -sfv "$file" "$target"
  else
    echo "Ignoring ${filename}"
  fi
done

echo
echo "Compiling and minifying bash_profile"

# Compile shrc/* into build/bash_profile
if [ ! -d "${here}/build" ]; then
  mkdir "${here}/build"
fi

touch "${here}/build/bash_profile"
cat /dev/null > "${here}/build/bash_profile"

for file in "$here"/shrc/*; do
  filename="$(basename "$file")"

  if [ "$filename" != "minimal.sh" ]; then
    if [ "$filename" = "osx.sh" ] && [ "$(uname -s)" = "Darwin" ]; then
      cat "$file" >> "${here}/build/bash_profile"
    elif [ "$filename" != "osx.sh" ]; then
      cat "$file" >> "${here}/build/bash_profile"
    fi
  fi
done

# Minify compiled bash_profile
minify_shell_script_file_in_place "${here}/build/bash_profile"

# Link compiled bash_profile to $HOME
ln -sfv "${here}/build/bash_profile" "${HOME}/.bash_profile"

echo
echo "Linking files in bin"

# Create $HOME/bin if it doesn't already exist
if [ ! -d "${HOME}/bin" ]; then
  mkdir -v "${HOME}/bin"
fi

# Link files in bin to $HOME/bin
for file in "${here}/bin"/*; do
  filename="$(basename "$file")"
  ln -sfv "${here}/bin/${filename}" "${HOME}/bin/${filename}"
done

# Link files in bin-labs to $HOME/bin
for file in "${here}/bin-labs"/*; do
  filename="$(basename "$file")"
  ln -sfv "${here}/bin-labs/${filename}" "${HOME}/bin/${filename}"
done
