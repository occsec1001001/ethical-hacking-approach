* * *
## check host

```
ping -c 1 -W 3 
```

* * *
## nmap

```bash
nmap -Pn -n -vvv -oN first IP
nmap -Pn -n -vvv -p1-500 -oN partial IP
nmap -Pn -n -vvv -p21,22,23,25,53,80,443,110,139,445,143,53,67,68,69,161 -oN targeted IP
nmap -sO -sV -sC -v -oN general  IP 
nmap -Pn -n -vvv -p- -oN allports IP
nmap -sA -oA firewall  IP 
nmap -sO -sV -sC -p- -v -oN allportsgeneral  IP  
nmap -sV --script vulners.nse,vulscan/vulscan.nse [target's address]


for ip $(cat iplist.txt); do nmap -p 80 -sS -T4 & $ip & done


```

* * *
## files / dirs


```bash
dirbuster
/usr/share/wordlists/dirbuster/
directory-list-2.3-medium.txt
directory-list-lowercase-2.3-medium.txt
directory-list-1.0.txt
directory-list-2.3-small.txt
directory-list-lowercase-2.3-small.txt
php,sh,txt,html,asp,aspx

gobuster -v -e -u <url> -w /usr/share/wordlists/<Wordlist file> -x .php,.txt,.html -s "200"
gobuster -v -e -u <url> -w /usr/share/wordlists/<Wordlist file> -x .php,.txt,.html -s "200" -o output.txt
gobuster -s 200,204,301,302,307,403 -u 172.21.0.0 -w /usr/share/seclists/Discovery/Web_Content/big.txt -t 80 -a 'Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0'

```

* * *
## subdomains / other intel

```bash
Sublist3r -d www.example.com
Sublist3r -v -d www.example.com -p 80,443
amass enum -d www.example.com
amass intel -whois -d www.example.com
dig www.example.com ANY +noall +answer
dnsrecon -d www.example.com -a 


```

* * *
## other recon

```bash
nikto
wpscan
weleakinfo
dehashed
haveibeenpwned
theHarvester
dnsenum
fierce
dig
host
nslookup
Enum4linux
evil-winrm
wappalyzer
whatweb
builtwith
```

* * *
## banner grabs

```bash
telnet ip port
nc -nv ip port
curl -iv ip
```
* * *

# sparta

```python
python /root/Reconnoitre/Reconnoitre/reconnoitre.py -t 10.11.1.111 -o test --services
```
* * * 

## other tricks

#### Linux Ping Sweep (Bash)

```bash
for i in {1..254} ;do (ping -c 1 172.21.10.$i | grep "bytes from" &) ;done
```

#### Windows Ping Sweep (Run on Windows System)
```bash
- for /L %i in (1,1,255) do @ping -n 1 -w 200 172.21.10.%i > nul && echo 192.168.1.%i is up.
```

## links

- #### [nmapAutomater](https://raw.githubusercontent.com/21y4d/nmapAutomator/master/nmapAutomator.sh)

- #### [nmapVulners](https://github.com/vulnersCom/nmap-vulners)

* * *
