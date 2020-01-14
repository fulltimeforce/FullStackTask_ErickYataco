#!/bin/bash

sudo curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get update
sudo apt-get install -y ruby
sudo apt-get install -y nodejs  git
sudo npm install pm2 -g

wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org --allow-unauthenticated

sudo service mongod start
sudo service mongod status
# sudo systemctl enable mongod && sudo systemctl start mongod

PUBLIC_IP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)
echo $PUBLIC_IP

# echo 'user www-data;
# worker_processes auto;
# pid /run/nginx.pid;
# events {
#         worker_connections 768;
#         # multi_accept on;
# }
# http {
#   server {
#     listen 80;
#     location / {
#       proxy_pass http://${PUBLIC_IP}:3000/;
#       proxy_set_header Host $host;
#       proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
#     }
#   }
# }' > /etc/nginx/nginx.conf

cd /home/ubuntu
sudo git clone -b ${branch} https://${user}:${pass}@github.com/ErickYataco/fulltimeforce-api-gateway.git
sudo mv fulltimeforce-api-gateway/gateway fulltimeforce-api-gateway/users /var/www
sudo rm -r fulltimeforce-api-gateway

cd /var/www/gateway
sudo npm install
sudo pm2 start server.js

cd /var/www/users
sudo npm install
sudo pm2 start index.js


# sudo pm2 startup
# sudo pm2 save
#sudo service nginx restart

