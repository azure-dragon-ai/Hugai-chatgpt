#!/bin/bash

# 请注意
# 本脚本的作用是把本项目编译的结果保存到deploy文件夹中
# 1. 把项目数据库文件拷贝到docker/db/init-sql
# 2. 编译leona-admin
# 3. 编译leona-all模块，然后拷贝到docker/leona

NEEKO_HOME=/home/hjh/git/leona-api
echo "NEEKO_HOME $NEEKO_HOME"
cd $NEEKO_HOME

git pull
# sudo -u hjh git pull

cd $NEEKO_HOME
mvn clean package
cp -f $NEEKO_HOME/target/leona-api.jar $NEEKO_HOME/docker/leona/leona.jar
cp -f $NEEKO_HOME/target/leona-api.jar $NEEKO_HOME/docker/leona-fe/leona.jar
cp -f $NEEKO_HOME/docker/leona/Dockerfile $NEEKO_HOME/docker/leona-fe/Dockerfile
cp -f $NEEKO_HOME/docker/leona/application.yml $NEEKO_HOME/docker/leona-fe/application.yml

cd $NEEKO_HOME/docker

tag=`date +%Y%m%d`
echo $tag
sudo docker build -t yiluxiangbei/leona:v$tag -f leona-fe/Dockerfile leona-fe
# sudo docker push yiluxiangbei/leona:v$tag
sudo docker tag yiluxiangbei/leona:v$tag registry.cn-beijing.aliyuncs.com/luomor/leona:v$tag
sudo docker push registry.cn-beijing.aliyuncs.com/luomor/leona:v$tag
