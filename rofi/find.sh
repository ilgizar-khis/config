#!/usr/bin/zsh

client=""

for term in kitty alacritty ghostty foot; do
	if [ -n "$(command -v $term)" ]; then
		client="$term"
	fi
done

if [[ "$ROFI_RETV" == "2" ]];then
	if [[ "$#" == "1" ]]; then
		echo "Show hiddens"
		echo -ne "\0data\x1f$1\n"
		echo -ne "\0prompt\x1f$1\n"
		find ~ -iname "*$1*" -not -path "*/.*"
	fi
elif [[ "$ROFI_RETV" == "1" ]];then
	if [[ "$1" == "Show hiddens" ]]; then
		find ~ -iname "*$ROFI_DATA*"
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
