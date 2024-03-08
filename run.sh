#!/bin/bash

# 删除旧的 yeti 和 yeti-feeds-frontend 目录
rm -rf yeti
rm -rf yeti-feeds-frontend

# 克隆最新的代码
git clone https://github.com/jax7sec/yeti-feeds-frontend.git
git clone https://github.com/jax7sec/yeti.git
cp yeti/yeti.conf.sample yeti/yeti.conf
# 构建并启动容器
docker-compose build --no-cache && docker-compose up
