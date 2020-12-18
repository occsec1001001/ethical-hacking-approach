#!/bin/bash

display_usage() { 
	echo "This script must be run as $0 [IP_LIST_FILE] \n" 
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

iplist=$1
touch allips.nmap
while read ip; do
    nmap -p- -T4 --max-retries 1 --max-scan-delay 20 --defeat-rst-ratelimit --open -sC -sV -A -oN scan1.$ip.nmap $ip
    cat scan1.$ip.nmap >> allips.nmap
done <$1

cat allips.nmap | grep -E "Nmap scan report for|/" | grep -v "Starting Nmap" > nmap_all_ips.results
rm allips.nmap

echo ""
echo ""
echo ""
echo ""
echo "List of files created"
ls $1*
