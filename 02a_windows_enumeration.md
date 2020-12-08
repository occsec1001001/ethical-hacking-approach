## system
```bash
wmic qfe get captionm description, hotfixid,installed-on
wmic logicaldisk get caption, description, provider,name
```

* * *
## user
```bash
net users
net users username
net groups
net localgroups
whoami /priv
whoami /groups
```



* * *
## network
```bash
ipconfig /all
arp -a
netstat -ano
```


* * *
## passwords
```bash
findstr /si password *txt, *.ini, *.config
```


* * *
## firewalls & av

```bash
sc query windefend
sc queryex type=service
netsh advfirewall firewall dump
netsh advfirewall firewall show rule name=all
netsh advfirewall firewall show stable
netsh advfirewall firewall show config

## advfirewall = new / firewall = old
```
