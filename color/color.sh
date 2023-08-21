#!/bin/bash

if [[ -d /usr/bin ]]; then
	if [ $(id -u) -ne 0 ]; then
		echo "Root Must"
		exit
	fi
	git clone https://github.com/Tony-Linux/color >/dev/null 2>&1
 	mv color/color /usr/bin/ >/dev/null 2>&1
  	chmod +x /usr/bin/color >/dev/null 2>&1
   	rm -rf color >/dev/null 2>&1
	color
elif [[ -d /data/data/com.termux/files/usr/bin ]]; then
	git clone https://github.com/Tony-Linux/color >/dev/null 2>&1	
	mv color /data/data/com.termux/files/usr/bin/ >/dev/null 2>&1	
	chmod +x /data/data/com.termux/files/usr/bin/color >/dev/null 2>&1	
	rm -rf color >/dev/null 2>&1
	color
fi
