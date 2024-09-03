#!/bin/bash

NEEKO_HOME=/home/hjh/git/neeko-api
echo "NEEKO_HOME $NEEKO_HOME"
cd $NEEKO_HOME

sudo -u neeko git pull

cd $NEEKO_HOME/docker

# create user 'neeko'@'%' identified by 'neeko123456';
# grant all privileges on neeko.* to 'neeko'@'%';
# flush privileges;
# mysql -h127.0.0.1 -uneeko -p

sudo docker-compose down
sudo docker-compose build
sudo docker image prune -f
sudo docker-compose up -d
