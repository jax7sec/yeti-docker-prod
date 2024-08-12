#  Container used to build the minified frontend JS code
FROM node:buster AS frontend-builder

# 设置时区为中国标准时间
ENV TZ Asia/Shanghai

RUN apt update && apt install git

COPY ./yeti-feeds-frontend /app
WORKDIR /app

RUN npm install
RUN npm run build

FROM nginx:latest AS frontend

# 创建需要的目录并设置适当的权限
RUN mkdir -p /var/cache/nginx /www /var/run/nginx && \
    chown -R www-data:www-data /var/cache/nginx /www /var/run/nginx

# 将构建后的前端代码从构建镜像中复制到 Nginx 的 Web 根目录
COPY --from=frontend-builder /app/dist /www

# 设置 Nginx 以非 root 用户身份运行
USER www-data

EXPOSE 80
