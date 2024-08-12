# Actual Yeti container
FROM python:3.10 AS yeti

# 设置时区为中国标准时间
ENV TZ Asia/Shanghai

# 创建非 root 用户和用户组
RUN groupadd -r appuser && useradd -r -g appuser appuser

# Python
RUN apt-get update && apt-get install -y \
    python3-pip \
    libmagic-dev \
    git \
    && apt-get clean && rm -rf /var/cache/apt/* /var/lib/apt/lists/*

COPY ./yeti /app

# 设置工作目录
WORKDIR /app

#RUN cp yeti.conf.sample yeti.conf
RUN cp ./extras/docker/docker-entrypoint.sh /docker-entrypoint.sh

# Upgrade pip
RUN pip3 install --upgrade pip && pip3 install poetry

# Install yeti
RUN poetry install --no-root --with plugins

# 创建并设置虚拟环境路径，确保 /home/appuser 可写
ENV VIRTUAL_ENV=/app/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# 确保目录权限正确
RUN chown -R appuser:appuser /app /home/appuser

# 切换到非 root 用户
USER appuser

ENV PYTHONPATH /app

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["webserver"]
