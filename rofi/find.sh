#!/usr/bin/zsh

client=""

# select client for open directories
for c in kitty alacritty ghostty foot thunar pcmanfm; do
	if [ -n "$(command -v $c)" ]; then
		client="$c"
		break
	fi
done

# user select item
if [[ "$ROFI_RETV" == "1" ]];then
	# show hidden files and dirs
	if [[ "$1" == "Show hiddens" ]]; then
		# check if "fd" exists
		if [ -n "$(command -v "fd")" ]; then
			fd --hidden "$ROFI_DATA"
		# if not exists run "find"
		else
			find ~ -iname "*$ROFI_DATA*"
		fi
	# run "client" with selected item
	else
		# if selected is dir
		if [ -d "$1" ]; then
			$client "$1" > /dev/null 2>&1 &
			disown 
		# if not dir
		else
			$client "$(dirname $1)" > /dev/null 2>&1 &
			disown 
		fi
	fi
# user enter custom item
elif [[ "$ROFI_RETV" == "2" ]];then
	# add "show hiddens" item
	echo "Show hiddens"
	# save "$1" to data
	echo -ne "\0data\x1f$1\n"
	# change prompt to "$1"
	echo -ne "\0prompt\x1f$1\n"
	# if "fd" is exists
	if [ -n "$(command -v "fd")" ]; then
		fd "$1"
	# if fd not exists
	else
		find ~ -iname "*$1*" -not -path "*/.*"
	fi
fi
