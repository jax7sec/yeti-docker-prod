# 构建前端代码
FROM node:buster AS frontend-builder

ENV TZ Asia/Shanghai

RUN apt update && apt install -y git

COPY ./yeti-feeds-frontend /app
WORKDIR /app

RUN npm install
RUN npm run build

# 设置 Nginx 运行环境
FROM nginx:latest AS frontend

# 创建非 root 用户
RUN groupadd -g 6000 app && useradd -m -u 6001 -g app app

# 创建必要的目录，并设置适当的权限
RUN mkdir -p /home/app/log /home/app/run /www && \
    chown -R app:app /home/app /www

# 复制前端构建输出
COPY --from=frontend-builder /app/dist /www

# 复制 Nginx 配置文件
COPY nginx.conf /etc/nginx/nginx.conf

# 切换到非 root 用户
USER app

# 暴露端口
EXPOSE 80

# 启动 Nginx
CMD ["nginx", "-g", "daemon off;"]
