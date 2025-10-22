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

# pacman
alias search='search_any pacman'
alias searchAUR='search_any yay'
alias get='sudo pacman --color=always -S'
alias getAUR='yay --color=always -S'
alias remove='sudo pacman -R'
alias removeAUR='yay -R'
alias purge='sudo pacman -Rns'
alias purgeAUR='yay -Rns'
alias update='sudo pacman -Syu'
alias updateAUR='yay -Syu'
alias cleanAUR='yay -Scc'
alias updateKeys='sudo pacman-key --refresh-keys'
alias listUpdate='pacman -Qu'
alias listSize='expac "%n %m" -l'\n' -Q $(pacman -Qq) | sort -rhk 2 | less'
alias updateOne='sudo pacman -S'
alias updateAUROne='sudo pacman -S'
alias removeCache='sudo pacman -Sc'
alias purgeCache='sudo pacman -Scc'
alias s='search'
alias g='get'
## apt
#alias search='apt-cache search'
#alias get='sudo apt-get install'
#alias remove='sudo apt-get remove'
#alias purge='sudo apt-get purge'
#alias update='sudo apt-get update'

# display information about the disks drives
alias disks='ls -l /dev/disk/by-uuid/ && sudo fdisk -l'

alias wallit='~/Pictures/wallit.sh'
