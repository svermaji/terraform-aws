#!/bin/bash
echo "start:...... executing update"
sudo yum -y update
echo "next step: ...... installing httpd"
sudo yum install -y httpd
echo "next step: ...... installing telnet"
sudo yum install -y telnet
echo "next step: ...... installing links for apachectl status"
sudo yum install -y links
echo "next step: ====> script completed"
# sudo apachectl start # yum update starts httpd
# sudo yum -y install java-1.8.0
# sudo yum -y remove java-1.7.0-openjdk
