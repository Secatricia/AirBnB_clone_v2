#!/usr/bin/env bash
#Bash script that sets up your web servers for the deployment of web_static
sudo apt-get -y update
sudo apt install -y nginx
mkdir -p /data/web_static/shared/
mkdir -p /data/web_static/releases/test/
ln -sf /data/web_static/current /data/web_static/releases/test/
touch /data/web_static/releases/test/index.html
printf %s "<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>" > /data/web_static/releases/test/index.html
sudo chown -Rh ubuntu:ubuntu /data
sudo chgrp -R ubuntu /data/
sed -i "38i\\\tlocation /hbnb_static/ {\n\t\t alias /data/web_static/current/;\n\t}\n" /etc/nginx/sites-available/default
service nginx start

