#! /bin/bash
sudo su
yum update -y
yum install httpd -y
service httpd start
chkconfig httpd on
cd /var/www/html
touch index.html
echo "<h1>Hello World from Terraform Cloud</h1>" > index.html
