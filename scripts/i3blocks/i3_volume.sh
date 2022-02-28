#!/bin/sh

case $BLOCK_BUTTON in
	1) amixer -D pulse set Master 1+ toggle | awk -F"[][]" '/Left:/ { print $2 " " $4 }';;
esac

amixer sget Master | awk -F"[][]" '/Mono:/ { print $2 " " $4 }'

exit 0
