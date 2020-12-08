* * *
## scrape links


```bash
mkdir scrapelinkdata
cd scrapelinkdata
wget -q -r 15 -x 5 IPADDRESS
cd ...
grep -r -Po -h '(?<=href=") [^"]*' scrapelinkdata/ > links.temp
grep "^http" links.temp > links.filtered
sort -u links.filtered > scrapelinks.list
grep 'username [^"]*' scrapelinkdata/ > username.scrape
grep 'password [^"]*' scrapelinkdata/ > password.scrape
grep 'token [^"]*' scrapelinkdata/ > token.scrape

rm -rf scrapelinkdata links.temp links.filtered

to try:
grep -r -Po -h '(?<=href=") [^"]*' scrapelinkdata/ | grep "^http" | sort -u > scrapedlinks.list

```

* * *
## Web


```bash
nikto --url http://IP
nikto -host ip -o niktoscan.txt
wpscan --url http://IP
wpscan --url http://IP --enumerate ap at u v
wpscan --url http://IP -e p,t,u --detection-mode aggressive > wpscan.txt
curl -i http://ip
/robots.txt
/sitemap.xml
/randomstringtothrowuperror
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
Sublist3r -d www.example.com -b -t 100
Sublist3r -v -d www.example.com -p 80,443
amass enum -d www.example.com
amass intel -whois -d www.example.com
dig www.example.com ANY +noall +answer
dnsrecon -d www.example.com -a 

```

