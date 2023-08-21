#!/bin/bash 
if [[ -d /usr/bin ]]; then
	if [ $(id -u) -ne 0 ]; then
		echo "Root must"
		exit
	fi
	git clone https://github.com/Tony-Linux/color
	mv color/color /usr/bin/color
	chmod +x /usr/bin/color
	rm -rf color
	clear
	color
	exit
elif [[ -d /data/data/com.termux/files/usr/bin ]]; then
	git clone https://github.com/Tony-Linux/color
	mv mv color/color /data/data/com.termux/files/usr/bin/color
	chmod +x /data/data/com.termux/files/usr/bin/color
	rm -rf color
	clear
	color
	exit
fi
