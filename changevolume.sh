#!/bin/bash

function send_notification {
	DIR="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"
	volume=$(pamixer --get-volume)

if [ "$volume" = "0" ]; then
	dunstify -i ~/.local/bin/icons/audio-volume-muted-symbolic.svg -a "changevolume" -u low -r "9993" -h int:value:"$volume" "Volume: ${volume}%" -t 2000
    else
	if [ "$volume" -lt "40" ]; then
		dunstify -i ~/.local/bin/icons/audio-volume-low-symbolic.svg -a "changevolume" -u low -r "9993" -h int:value:"$volume" "Volume: ${volume}%" -t 2000
	else
	    if [ "$volume" -lt "70" ]; then
		dunstify -i ~/.local/bin/icons/audio-volume-medium-symbolic.svg -a "changevolume" -u low -r "9993" -h int:value:"$volume" "Volume: ${volume}%" -t 2000
	    else
		if [ "$volume" -lt "100" ]; then
		    dunstify -i ~/.local/bin/icons/audio-volume-high-symbolic.svg -a "changevolume" -u low -r "9993" -h int:value:"$volume" "Volume: ${volume}%" -t 2000
		else
		     dunstify -i $DIR/icons/audio-volume-overamplified-symbolic.svg -a "changevolume" -u low -r "9993" -h int:value:"$volume" "Volume: ${volume}%" -t 2000		
	    fi
        fi
    fi
fi

}


case $1 in
up)
	# Set the volume on (if it was muted)
	pamixer -u
	pamixer -i 5 --allow-boost
	send_notification $1
	;;
down)
	pamixer -u
	pamixer -d 5 --allow-boost
	send_notification $1
	;;
mute)
	pamixer -t
	if $(pamixer --get-mute); then
		icon_name="$DIR/icons/audio-volume-muted-symbolic.svg"
		dunstify -i ~/.local/bin/icons/audio-volume-muted-symbolic.svg -a "changevolume" -t 2000 -r 9993 -u low "Muted"
 	else
		send_notification up
	fi
	;;
esac
