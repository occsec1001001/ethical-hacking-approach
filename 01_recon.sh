#!/bin/bash

display_usage() { 
	echo "This script must be run as $0 [DOMAIN] \n" 
	} 
# if less than one arguments supplied, display usage 
	if [  $# -le 0 ] 
	then 
		display_usage
		exit 1
	fi 

    if [[ ( $# == "--help") ||  $# == "-h" ]] 
	then 
		display_usage
		exit 0
	fi

pingcheck=$(ping -c 1 -W 3 "$1" | grep ttl)
echo $pingcheck > $1.ping
cat $1.ping | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' > $1.IP
sublist=$(sudo sublist3r -d $1 -v -o $1.subdom1)
$sublist
cat $1.subdom1 | sed "s~<BR>~\n~g" | sort --unique > $1.subdom
rm $1.subdom1

