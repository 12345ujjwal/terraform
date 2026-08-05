#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx

echo "<H1> Hello form SKILL NEBULA ! </H1>" > /var/www/html/index.html
