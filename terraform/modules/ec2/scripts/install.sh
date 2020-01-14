#!/bin/bash

sudo curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get update
sudo apt-get install -y ruby
sudo apt-get install -y nginx nodejs  git
sudo npm install pm2 -g

wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org --allow-unauthenticated

sudo service mongod start
sudo service mongod status
# sudo systemctl enable mongod && sudo systemctl start mongod

cd /home/ubuntu
sudo git clone -b ${branch} https://${user}:${pass}@github.com/ErickYataco/fulltimeforce-api-gateway.git
sudo mv fulltimeforce-api-gateway/gateway fulltimeforce-api-gateway/users fulltimeforce-api-gateway/roles /var/www
sudo rm -r fulltimeforce-api-gateway

# cd /var/www/gateway
# sudo npm install
# sudo pm2 start server.js

cd /var/www/users
sudo npm install
sudo pm2 start index.js

cd /var/www/roles
sudo npm install
sudo pm2 start index.js


# sudo pm2 startup
# sudo pm2 save
#sudo service nginx restart

