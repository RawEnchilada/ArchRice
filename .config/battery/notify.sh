#!/bin/bash
percent=$(upower -d | grep 'percentage' | head -1 | grep -Eo '[0-9]{1,4}')
content=$(cat /home/enchilada/.config/battery/stat)


if  [ "$percent" -ge 90 ] && [ "$content" != "f" ] ; then
	echo "f" > /home/enchilada/.config/battery/stat
	twmnc -t "Battery" -c "Full - 90%" -d 5000

elif  [ "$percent" -le 25 ] && [ "$content" != "l" ] && [ "$content" != "c" ] ; then
    echo "l" > /home/enchilada/.config/battery/stat
	twmnc -t "Battery" -c "Low - 25%" -d 5000

elif  [ "$percent" -le 15 ] && [ "$content" != "c" ] ; then
    echo "c" > /home/enchilada/.config/battery/stat
	twmnc -t "Battery" -c "Critical - 15%" -d 5000

elif  [ "$percent" -le 50 ] && [ "$content" != "h" ] && [ "$content" != "l" ] && [ "$content" != "c" ] ; then
	echo "h" > /home/enchilada/.config/battery/stat
fi
