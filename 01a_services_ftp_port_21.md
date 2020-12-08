
* * *
## test for anon login

```bash
nmap -Pn -n -vvv -p21 -sC -sV IP

ftp IP
> anonymous
> userisme

```
* * *
## uploading a file

```bash
> put myexploitfile.aspx
```

* * *
## bruteforcing login

```bash
hydra -V -f -L userlist.txt -P passwords.txt ftp://IP -u -vV
```

