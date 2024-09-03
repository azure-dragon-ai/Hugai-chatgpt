#!/bin/bash

# 请注意
# 本脚本的作用是把本项目编译的结果保存到deploy文件夹中
# 1. 把项目数据库文件拷贝到docker/db/init-sql
# 2. 编译leona-admin
# 3. 编译leona-all模块，然后拷贝到docker/leona

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
cd $DIR/../..
NEEKO_HOME=$PWD
echo "NEEKO_HOME $NEEKO_HOME"

# 复制数据库
# cat $NEEKO_HOME/leona-db/sql/leona_schema.sql > $NEEKO_HOME/docker/db/init-sql/leona.sql
# cat $NEEKO_HOME/leona-db/sql/leona_table.sql >> $NEEKO_HOME/docker/db/init-sql/leona.sql
# cat $NEEKO_HOME/leona-db/sql/leona_data.sql >> $NEEKO_HOME/docker/db/init-sql/leona.sql
# cat $NEEKO_HOME/leona-db/sql/leona_chinatower.sql >> $NEEKO_HOME/docker/db/init-sql/leona.sql

cd $NEEKO_HOME/leona-admin
# 安装阿里node镜像工具
npm install -g cnpm --registry=https://registry.npm.taobao.org
# 安装node项目依赖环境
cnpm install
cnpm run build:dep

cd $NEEKO_HOME
mvn clean package
cp -f $NEEKO_HOME/leona-all/target/leona-all-*-exec.jar $NEEKO_HOME/docker/leona/leona.jar