#!/bin/bash

NEEKO_HOME=/home/hjh/git/leona-api
echo "NEEKO_HOME $NEEKO_HOME"
cd $NEEKO_HOME

sudo -u leona git pull

cd $NEEKO_HOME/docker

# create user 'leona'@'%' identified by 'leona123456';
# grant all privileges on leona.* to 'leona'@'%';
# flush privileges;
# mysql -h127.0.0.1 -uleona -p

sudo docker-compose down
sudo docker-compose build
sudo docker image prune -f
sudo docker-compose up -d
