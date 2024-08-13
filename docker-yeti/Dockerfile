FROM python:3.10 AS yeti

# 设置时区为中国标准时间
ENV TZ Asia/Shanghai

# 创建非 root 用户和用户组，并将 home 目录设置为 /app
RUN groupadd -g 6000 app && useradd -u 6001 -g app -d /app -s /bin/bash app

# 更新包索引并安装所需的软件包
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-pip \
    libmagic-dev \
    git \
    && apt-get clean && rm -rf /var/cache/apt/* /var/lib/apt/lists/*

# 复制应用程序代码
COPY ./yeti /app

# 设置工作目录
WORKDIR /app

# 复制 docker-entrypoint.sh 文件
RUN cp ./extras/docker/docker-entrypoint.sh /docker-entrypoint.sh

# 创建必要的目录并设置权限
RUN mkdir -p /app/.cache /app/.venv /var/log/yeti_log /var/run /data/app/yeti-data/yeti_log \
    && touch /var/log/yeti_log/yeti_audit.log /var/log/yeti_log/yeti_system.log \
    && chown -R app:app /app/.cache /app/.venv /var/log/yeti_log /var/run /data/app/yeti-data/yeti_log

# 升级 pip 并安装 Poetry
RUN pip3 install --upgrade pip && pip3 install poetry

# 安装 Yeti
RUN poetry install --no-root --with plugins

# 确保虚拟环境目录对 app 用户可读写
RUN chown -R app:app /app/.cache /app/.venv /var/log/yeti_log /var/run /data/app/yeti-data/yeti_log

# 切换到非 root 用户
USER app

# 设置 Python 路径
ENV PYTHONPATH /app

# 入口点和默认命令
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["webserver"]
