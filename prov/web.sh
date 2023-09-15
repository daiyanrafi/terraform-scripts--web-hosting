#!/bin/bash
yum install wget unzip httpd -y
systemctl start httpd
systemctl enable httpd
wget https://www.xyz.com/zip.zip
unzip zip.zip
cp -r zip/* /var/www/html/
rm -rf zip.zip zip
systemctl restart httpd
```