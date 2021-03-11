# Flush Directory Service cache
alias flush='dscacheutil -flushcache && killall -HUP mDNSResponder'

# Curl headers
alias headers='curl -I'

# IP addresses
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"
alias localip='ipconfig getifaddr en1'
