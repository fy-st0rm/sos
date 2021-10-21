#!/bin/bash

case $BLOCK_BUTTON in 
	1) notify-send --expire-time=5000 "CPU Eater!!
$(ps axch -o cmd,%cpu --sort=-%cpu | head)";;
	3) alacritty -e htop;;
esac

ps -A -o %cpu | awk '{s+=$1} END {print s "%"}'

exit 0
