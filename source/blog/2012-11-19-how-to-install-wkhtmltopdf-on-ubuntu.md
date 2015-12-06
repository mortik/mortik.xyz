---
title: "How to install wkhtmltopdf on Ubuntu"
published: true
tags: Coding
active_page: article
---
``` sh
sudo apt-get install openssl build-essential xorg libssl-dev

wget http://wkhtmltopdf.googlecode.com/files/wkhtmltopdf-0.11.0_rc1-static-amd64.tar.bz2

tar xvjf wkhtmltopdf-0.11.0_rc1-static-amd64.tar.bz2

chown root:root wkhtmltopdf-amd64

mv wkhtmltopdf-amd64 /usr/bin/wkhtmltopdf
```
**Note:** this guide is only for Ubuntu 64-Bit and the current release for wkhtmltopdf might have changed in the meantime. Check [http://wkhtmltopdf.googlecode.com] if you want to use the newest release.
