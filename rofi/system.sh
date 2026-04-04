if [[ -n "$1" ]]; then
    case "$1" in
        wifi)
            kitty --title parametrs impala < /dev/null > /dev/null 2>&1 &
            disown
            ;;
        sound)
            kitty --title parametrs wiremix --tab output < /dev/null > /dev/null 2>&1 &
            disown
            ;;
        calendar)
            kitty --title parametrs calcurse < /dev/null > /dev/null 2>&1 &
            disown
            ;;
        bluetooth)
            kitty --title parametrs bluetui < /dev/null > /dev/null 2>&1 &
            disown
            ;;
    esac

    exit 0
else
    echo "wifi"
    echo "bluetooth"
    echo "sound"
    echo "calendar"
fi
