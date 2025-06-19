#!/bin/bash

# enable and start httpd service
systemctl enable httpd
systemctl start httpd

# go to directory for web server files
cd /var/www/html

# make directory from argument of script call
mkdir $1

# copy index.html in our directory to the new directory
cp /home/lucas/Documents/index.html /var/www/html/$1/index.html

chmod +x /var/www/html/$1/index.html

# firewall configuration commands
firewall-cmd --zone=external --add-service=http --permanent
firewall-cmd --reload
firewall-cmd --set-default-zone=external
firewall-cmd --zone=external --add-port=80/tcp --permanent
firewall-cmd --reload
