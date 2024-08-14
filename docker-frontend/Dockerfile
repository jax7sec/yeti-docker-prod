FROM node:buster AS frontend-builder

# 设置时区为中国标准时间
ENV TZ Asia/Shanghai

# 更新包索引并安装 git
RUN apt update && apt install -y git

# 复制前端代码并进入工作目录
COPY ./yeti-feeds-frontend /app
WORKDIR /app

# 安装依赖并构建前端应用
RUN npm install
RUN npm run build

FROM nginx:latest AS frontend

# 创建 app 用户和组
RUN groupadd -g 6000 app && useradd -m -u 6001 -g app app

# 创建需要的目录并设置适当的权限
RUN mkdir -p /var/cache/nginx /www /var/run/nginx /var/log/nginx && \
    chown -R app:app /var/cache/nginx /www /var/run/nginx /var/log/nginx

# 将构建后的前端代码从构建镜像中复制到 Nginx 的 Web 根目录
COPY --from=frontend-builder /app/dist /www

# 确保所有文件的权限都已正确设置为 app 用户
RUN chown -R app:app /www

# 设置工作目录
WORKDIR /www

# 确保 app 用户可以写入必要文件
RUN touch /var/run/nginx.pid && chown app:app /var/run/nginx.pid

# 切换到非 root 用户
USER app

# 暴露端口
EXPOSE 80

# 启动 nginx
CMD ["nginx", "-g", "daemon off;"]
