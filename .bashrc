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
