#!/bin/bash

# 请注意
# 本脚本的作用是把本项目编译的结果保存到deploy文件夹中
# 1. 把项目数据库文件拷贝到docker/db/init-sql
# 2. 编译neeko-admin
# 3. 编译neeko-all模块，然后拷贝到docker/neeko

NEEKO_HOME=/home/hjh/git/neeko-api
echo "NEEKO_HOME $NEEKO_HOME"
cd $NEEKO_HOME

git pull
# sudo -u hjh git pull

cd $NEEKO_HOME
mvn clean package
cp -f $NEEKO_HOME/target/neeko-api.jar $NEEKO_HOME/docker/neeko/neeko.jar
cp -f $NEEKO_HOME/target/neeko-api.jar $NEEKO_HOME/docker/neeko-fe/neeko.jar
cp -f $NEEKO_HOME/docker/neeko/Dockerfile $NEEKO_HOME/docker/neeko-fe/Dockerfile
cp -f $NEEKO_HOME/docker/neeko/application.yml $NEEKO_HOME/docker/neeko-fe/application.yml

cd $NEEKO_HOME/docker

tag=`date +%Y%m%d`
echo $tag
sudo docker build -t yiluxiangbei/neeko:v$tag -f neeko-fe/Dockerfile neeko-fe
# sudo docker push yiluxiangbei/neeko:v$tag
sudo docker tag yiluxiangbei/neeko:v$tag registry.cn-beijing.aliyuncs.com/luomor/neeko:v$tag
sudo docker push registry.cn-beijing.aliyuncs.com/luomor/neeko:v$tag
