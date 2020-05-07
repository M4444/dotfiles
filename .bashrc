# Deal with delete key in st
tput smkx

#COLOR_GREEN="\e[32m"
COLOR_GREEN="\[\e[38;5;32m\]"
COLOR_RED="\[\e[31m\]"
COLOR_DIM="\[\e[2m\]"
COLOR_DIM_OFF="\[\e[22m\]"
COLOR_OFF="\[\e[39m\]"

# If id command returns zero, you got root access.
if [ $(id -u) -eq 0 ]; then
# root
	PS1="[$COLOR_RED\\u@\\h$COLOR_DIM:$COLOR_DIM_OFF\\w$COLOR_OFF]$ "
else
# normal user
	PS1="[$COLOR_GREEN\\u@\\h$COLOR_DIM:$COLOR_DIM_OFF\\w$COLOR_OFF]$ "
fi

# General aliases
alias ls="ls --color=always"
alias grep="grep --color=always"

# Enable custom aliases
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# ---------------- Custom functions ----------------

# check if the last command was successful
function check()
{
	if [ $? -eq 0 ]; then
		echo -e "[\e[32m SUCCESS \e[39m]"
	else
		echo -e "[\e[31m FAIL \e[39m]"
	fi
}

# display the weather forecast
function wttr()
{
	curl sr.wttr.in/$1
}

# display the cheat sheet for a command
function cheat()
{
	curl cht.sh/$1;
}

# check if executable files contain debug info
function checkdebug()
# using '(' instead of '{' in order to restrict the scope of the inner function
(
	function print_result()
	{
		printf "%s" "$1"
		# print the required number of spaces so that all of the output
		# results are aligned
		printf ' %.0s' $(seq $((maxlen - ${#1} + 1)))
		case "$2" in
		0)
			echo -e "[\e[32m SUCCESS \e[39m- $3 ]"
			;;
		1)
			echo -e "[\e[33m FAIL \e[39m- $3 ]"
			;;
		2)
			echo -e "[\e[31m ERROR \e[39m- $3 ]"
			;;
		esac
	}

	# check if there are any arguments
	if [ "$#" -lt 1 ]; then
		echo -e "[\e[31m ERROR \e[39m- no file(s) specified ]"
	fi

	# find the longest input argument
	maxlen=0
	for i in "$@"; do
		curlen=${#i}
		if [ $maxlen -lt $curlen ]; then
			maxlen=$curlen
		fi
	done
	# iterate over input arguments
	for i in "$@"; do
		# check if the file exists
		if [ ! -e $i ]; then
			print_result $i 2 "file doesn't exist"
			continue
		fi
		# check if the file is a directory
		if [ -d $i ]; then
			print_result $i 2 "file is a directory"
			continue
		fi
		# check if the file is an executable linux binary
		if [ ! -x "$i" ] || ! file "$i" | grep -q "GNU/Linux"; then
			print_result $i 2 "not an executable binary"
			continue
		fi

		# check if the file has debug info
		objdump -h -j .debug_info $i &> /dev/null
		if [ $? -eq 0 ]; then
			print_result $i 0 "found debug info"
		else
			print_result $i 1 "no debug info found"
		fi
	done
)
