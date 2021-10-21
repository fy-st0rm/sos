#!/bin/bash

case $BLOCK_BUTTON in
	1) notify-send --expire-time=5000 "Memory Eaters!!
$(ps axch -o cmd,%mem --sort=-%mem | head)";;
	
	3) alacritty -e htop;;
esac

free -h | awk '/Mem:/ { print $3 }'

exit 0
