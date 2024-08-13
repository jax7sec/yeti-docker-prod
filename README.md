## Prod deployment

```
git clone git@github.com:jax7sec/yeti-docker-prod.git
cd yeti-docker-prod/

# 克隆Yeti前后端代码
git clone git@github.com:jax7sec/yeti-feeds-frontend.git
git clone git@github.com:jax7sec/yeti.git

# 复制编辑配置文件
cp yeti/yeti.conf.sample yeti/yeti.conf

# 构建并启动容器
docker-compose build --no-cache && docker-compose up
```
