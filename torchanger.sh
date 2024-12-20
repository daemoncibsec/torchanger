#!/bin/bash
sudo echo -e "\n  _____         ___ _                          "
echo -e " |_   _|__ _ _ / __| |_  __ _ _ _  __ _ ___ _ _ "
echo -e "   | |/ _ \ '_| (__| ' \/ _\` | ' \/ _\` / -_) '_|"
echo -e "   |_|\___/_|  \___|_||_\__,_|_||_\__, \___|_|  "
echo -e "                                  |___/         \n"
if [ "$1" == '-install' ];then
	echo -e 'Installing dependencies'
	sudo apt install iptables -y &> /dev/null
	git clone https://github.com/Und3rf10w/kali-anonsurf.git &> /dev/null
	sudo ./kali-anonsurf/installer.sh &> /dev/null
	echo -e 'Testing Anonsurf\n'
	sudo anonsurf start | grep 'You are'
	echo -e '\nAnonsurf is working. Stopping the service.\n'
	sudo anonsurf stop | grep 'Anonymous'
	echo -e '\nInstallation complete.\n'
	sudo rm -R kali-anonsurf
elif [ "$1" == '-h' ];then
	echo -e 'Displaying help:\n\n-install\tTo install the dependencies\n-s <seconds>\tTo set the numeric value to seconds\n-m <minutes>\tTo set the numeric value to minutes\n-h <hours>\tTo set the numeric value to hours\n'
elif [ "$1" == '-s' ];then
	if [[ "$2" =~ ^[1-9][0-9]*$ ]];then
		while true;do
			sudo anonsurf start &> /dev/null
			echo -e 'An onion IP has been successfully obtained.\n'
			sleep $2
			sudo anonsurf stop &> /dev/null
			echo -e 'Reloading IP address.\n'
		done
	else
		echo -e 'An error has occurred. Please introduce a valid numeric number.\n'
	fi
elif [ "$1" == '-m' ];then
	minutes=$(($2 * 60))
	if [[ "$2" =~ ^[1-9][0-9]*$ ]];then
		while true;do
			sudo anonsurf start &> /dev/null
			echo -e 'An onion IP has been successfully obtained.\n'
			sleep $minutes
			sudo anonsurf stop &> /dev/null
			echo -e 'Reloading IP address.\n'
		done
	else
		echo -e 'An error has occurred. Please introduce a valid numeric number.\n'
	fi
elif [ "$1" == '-h' ];then
	hours=$(($2 * 3600))
	if [[ "$2" =~ ^[1-9][0-9]*$ ]];then
		while true;do
			sudo anonsurf start &> /dev/null
			echo -e 'An onion IP has been successfully obtained.\n'
			sleep $hours
			sudo anonsurf stop &> /dev/null
			echo -e 'Reloading IP address.\n'
		done
	else
		echo -e 'An error has occurred. Please introduce a valid numeric number.\n'
	fi
else
	echo -e 'An error occurred. Please specify the parameter:\n-install\tTo install the dependencies\n-s <seconds>\tTo set the numeric value to seconds\n-m <minutes>\tTo set the numeric value to minutes\n-h <hours>\tTo set the numeric value to hours\n'
fi
