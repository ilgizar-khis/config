#!/usr/bin/zsh

client=""

for c in kitty alacritty ghostty foot thunar pcmanfm; do
	if [ -n "$(command -v $c)" ]; then
		client="$c"
		break
	fi
done

if [[ "$ROFI_RETV" == "2" ]];then
	if [[ "$#" == "1" ]]; then
		echo "Show hiddens"
		echo -ne "\0data\x1f$1\n"
		echo -ne "\0prompt\x1f$1\n"
		if [ -n "$(command -v "fd")" ]; then
			fd "$1"
		else
			find ~ -iname "*$1*" -not -path "*/.*"
		fi
	fi
elif [[ "$ROFI_RETV" == "1" ]];then
	if [[ "$1" == "Show hiddens" ]]; then
		if [ -n "$(command -v "fd")" ]; then
			fd --hidden "$ROFI_DATA"
		else
			find ~ -iname "*$ROFI_DATA*"
		fi
	else
		if [ -d "$1" ]; then
			$client "$1" > /dev/null 2>&1 &
			disown 
		else
			$client "$(dirname $1)" > /dev/null 2>&1 &
			disown 
		fi
	fi
fi
