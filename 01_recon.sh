

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

sudo rm *$1*
pingcheck=$(ping -c 1 -W 3 "$1" | grep ttl)
echo $pingcheck > $1.ping
cat $1.ping | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' > $1.IP
sublist=$(sudo sublist3r -d $1 -v -o $1.subdom1)
echo $sublist
cat $1.subdom1 | sed "s~<BR>~\n~g" | sort --unique > $1.subdom
rm $1.subdom1

ipadd=$(cat $1.IP)

nmap -Pn -T4 --max-retries 1 --max-scan-delay 20 --defeat-rst-ratelimit --open -oN quick_$1.nmap $ipadd
cat quick_$1.nmap | grep / > $1.ports


while read sd; do
    ping -c 1 -W 3 $sd | grep "(" >> $1subdom.pings;
    #ping -c 1 -W 3 $sd | grep ": Name or service not known" >> $1subdom.notping
    #ping -c 1 -W 3 $sd | grep "No address associated with hostname" >> $1subdom.noaddping
done <$1.subdom

cat $1subdom.pings | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | sort --unique > $1.subdom.IPs
#nmap -p- --max-retries 1 --max-rate 500 --max-scan-delay 20 -T4 -v -oN full_"$1".nmap "$1"
#nmap -sV --script vulners --script-args mincvss=7.0 -p$(echo "${ports}") -oN nmap/CVEs_"$1".nmap "$1"
# ping sweep
# nmap -n -vv -sn 192.168.1.1-255 -oG - | grep -i 'up'

#nmap -sV --script vulners --script-args mincvss=7.0 -p
#nmap -sV --script vuln -p


echo ""
echo ""
echo ""
echo ""
echo "List of files created"
ls $1*


