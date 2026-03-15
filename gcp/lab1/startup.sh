#!/bin/sh
sudo apt update
sudo apt install -yq nginx
echo "<h1>Hello, World!</h1>" > /var/www/html/index.html
