FROM node:buster AS frontend-builder

# 设置时区为中国标准时间
ENV TZ Asia/Shanghai

# 更新包索引并安装 git
RUN apt update && apt install -y git

COPY ./yeti-feeds-frontend /app
WORKDIR /app

RUN npm install
RUN npm run build

FROM nginx:latest AS frontend

# 创建 app 用户和组
RUN groupadd -g 6000 app && useradd -m -u 6001 -g app app

# 创建需要的目录并设置适当的权限
RUN mkdir -p /var/cache/nginx /www /var/run/nginx && \
    chown -R app:app /var/cache/nginx /www /var/run/nginx

# 将构建后的前端代码从构建镜像中复制到 Nginx 的 Web 根目录
COPY --from=frontend-builder /app/dist /www

# 切换到非 root 用户
USER app

# 可选：在 nginx 配置中设置 user app;
# RUN echo "user app;" >> /etc/nginx/nginx.conf

EXPOSE 80
