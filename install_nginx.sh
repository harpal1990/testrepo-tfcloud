#!/bin/bash
cd /tmp
sudo apt-get update
sudo apt-get install nginx -y
sudo echo "Hello from the EC2 instance $(hostname -f)." > /var/www/html/index.nginx-debian.html
sudo systemctl start nginx
