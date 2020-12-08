### A list of additional tools and applications loaded into Kali


```
git clone https://github.com/khast3x/h8mail /opt/h8mail
```
```
git clone https://github.com/leebaird/discover /opt/discover
```
```
https://github.com/21y4d/nmapAutomator.git /opt/nmapAutomator
```

```
git clone https://github.com/TheRook/subbrute.git /opt/subbrute
```
```
git clone https://github.com/laramies/theHarvester.git /opt/theHarvester
```
```
git clone https://github.com/scipag/vulscan scipag_vulscan
ln -s `pwd`/scipag_vulscan /usr/share/nmap/scripts/vulscan

nmap -sV --script=vulscan/vulscan.nse IP
```
```
cd /usr/share/nmap/scripts/
git clone https://github.com/vulnersCom/nmap-vulners.git

nmap --script nmap-vulners -sV IP
```
```nmap -sV --script vulners.nse,vulscan/vulscan.nse [target's address]
```



