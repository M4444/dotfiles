# display file size
alias getsize='du -sh'

# display space used
alias spaceused='df -h'

# show path
alias pathenv="echo \$PATH | tr : '\n'"

# edit aliases
alias aliases="vim ~/.bash_aliases && source ~/.bash_aliases"
# edit functions
alias functions="vim ~/.bashrc && source ~/.bashrc"

# apt
alias search='apt-cache search'
alias get='sudo apt-get install'
alias remove='sudo apt-get remove'
alias purge='sudo apt-get purge'
alias update='sudo apt-get update'

# display information about the disks drives
alias disks='ls -l /dev/disk/by-uuid/ && sudo fdisk -l'
