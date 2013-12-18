# Define standard math lib by default
alias bc='bc -l'

# Show current year by default
alias cal='date && echo && cal -y'

# Compile `.less` from `.lesskey` in dotfiles directory
alias makelesskey='lesskey -o ~/dotfiles/less ~/dotfiles/lesskey'

# Intuitive map function
# For example, to list all directories that contain a certain file:
# `find . -name .gitattributes | map dirname`
alias map='xargs -n1'

# Create a sha1
alias sha='openssl sha1'

# Enable aliases to be sudo'ed
alias sudo='sudo '

# Build recursive CTags index
alias tags='ctags -R -f tags'

# VirtualBox
alias vbox='vboxmanage'
