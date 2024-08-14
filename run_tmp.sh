#!/bin/bash

# 删除旧的 yeti 和 yeti-feeds-frontend 目录
rm -rf yeti
rm -rf yeti-feeds-frontend
mkdir /data/app/yeti-data
mkdir /data/app/yeti-data/yeti_log
echo " " > /data/app/yeti-data/yeti_log/yeti_audit.log
echo " " > /data/app/yeti-data/yeti_log/yeti_system.log
chmod 666 /data/app/yeti-data/yeti_log/yeti_audit.log
chmod 666 /data/app/yeti-data/yeti_log/yeti_system.log

# 克隆最新的代码
#git clone https://github.com/jax7sec/yeti-feeds-frontend.git
git clone git@github.com:jax7sec/yeti-feeds-frontend.git
#git clone https://github.com/jax7sec/yeti.git
git clone git@github.com:jax7sec/yeti.git
cp ../yeti.conf yeti/yeti.conf
cp ../.env .env
cp /root/test/backup/*.py yeti/plugins/feeds/public/
chmod +x yeti/extras/docker/docker-entrypoint.sh
# 构建并启动容器
docker-compose build --no-cache && docker-compose up
