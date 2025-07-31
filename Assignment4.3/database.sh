#!/bin/bash
# This is a script to setup and configure mysql
dnf update -y
dnf install mysql-server -y
echo "Installed mysql"
systemctl enable mysqld
echo "enabled mysqld service on start up"
systemctl start mysqld
echo "mysqld service is started"
echo "you will be asked to type a password twice"
echo "accept all terms of the installation"
mysql_secure_installation
