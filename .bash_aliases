# check if the last command was successful
alias check='if [ $? -eq 0 ]; then echo -e "[\e[32m SUCCESS \e[39m]"; else echo -e "[\e[31m FAIL \e[39m]"; fi'

# display file size
alias getsize='du -sh'

# display space used
alias spaceused='df -h'

# show path
alias pathenv="echo \$PATH | tr : '\n'"

# edit aliases
alias aliases="vim ~/.bash_aliases && source ~/.bash_aliases"

# apt
alias search='apt-cache search'
alias get='sudo apt-get install'
alias remove='sudo apt-get remove'
alias purge='sudo apt-get purge'
alias update='sudo apt-get update'

# display information about the disks drives
alias disks='ls -l /dev/disk/by-uuid/ && sudo fdisk -l'

# display the weather forecast
alias wttr='curl sr.wttr.in'

# display the cheat sheet for a command
alias cheat='ch() { curl cht.sh/$1; }; ch'
