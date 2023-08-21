#!/bin/bash

if [[ -d /usr/bin ]]; then
	if [ $(id -u) -ne 0 ]; then
		echo "Root Must"
		exit
	fi
	git clone https://github.com/Tony-Linux/color
	cd color
	mv color /usr/bin/
	chmod +x /usr/bin/color
	clear
	color
elif [[ -d /data/data/com.termux/files/usr/bin ]]; then
	git clone https://github.com/Tony-Linux/color
	cd color
	mv color /data/data/com.termux/files/usr/bin/
	chmod +x /data/data/com.termux/files/usr/bin/color
	clear
	color
fi
