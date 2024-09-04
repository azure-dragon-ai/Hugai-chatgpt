```shell
mvn clean package
cp modules-business/target/modules-business-1.0.0.jar docker/leona-fe/leona.jar
cp module-common/target/module-common-1.0.0.jar docker/leona-fe/module-common-1.0.0.jar
cp docker/leona/application.yml docker/leona-fe/
cp docker/leona/Dockerfile docker/leona-fe/

sudo docker compose build
sudo docker compose down
sudo docker compose up
sudo docker compose up -d
sudo docker compose up -d leona-rabbitmq

https://github.com/DaoCloud/public-image-mirror
sudo docker cp rabbitmq:/etc/rabbitmq ./mq-conf

sudo docker compose ps
sudo docker compose logs -f
sudo docker compose logs -f leona

sudo docker compose up -d leona-mysql80
sudo docker compose stop leona-mysql80
sudo docker compose rm leona-mysql80

sudo docker compose up leona
sudo docker compose up -d leona
sudo docker compose stop leona
sudo docker compose start leona
sudo docker compose rm leona
sudo docker compose logs -f leona

mvn clean package -Pprod
nohup java -jar -Dspring.profiles.active=prod leona-api.jar &
npm run build

curl 'myip.ipip.net'

mysql -h127.0.0.1 -uroot -P3310 -p
leona123456

create database leona default character set utf8mb4 collate utf8mb4_unicode_ci;

create user 'leona'@'127.0.0.1' identified by 'leona123456';
grant all privileges on leona.* to 'leona'@'127.0.0.1';
flush privileges;

create user 'leona'@'%' identified by 'leona123456';
grant all privileges on leona.* to 'leona'@'%';
flush privileges;

mysqldump -h127.0.0.1 -uroot -P3306 -p leona > leona20240606.sql
mysql -h127.0.0.1 -uroot -P3310 -p leona < ../_doc/sql/db_hugai.sql
mysql -h10.0.0.13 -uroot -P3306 -p
mysql -h10.0.0.13 -uroot -P3306 -p leona < leona20240606.sql

redis-cli -h 127.0.0.1 -p 6380
auth default leona123456

redis-cli -h 10.0.0.8
auth panda2024
select 1
keys *
flushall

mysql -h10.0.0.13 -uroot -P3306 -p
leona123456
use leona
show tables;
select * from wx_user;
truncate table wx_user;
mysql -h10.0.0.13 -uleona -P3306 -p
leona123456

http://152.136.174.88:8080/
http://152.136.174.88:8080/doc.html
https://ai2.wepromo.cn

npm install -g cnpm --registry=https://registry.npmmirror.com

cd ui-admin
#cnpm install
npm install
npm run dev
npm run build:prod

https://ai2-1.wepromo.cn
admin
123456

https://ai2-2.wepromo.cn
test
123456

cd ui-client
#cnpm install
npm install
npm run serve
npm run build

sudo docker rmi `docker images | grep none | awk '{print $3}'`
```