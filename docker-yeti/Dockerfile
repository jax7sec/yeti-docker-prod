# Actual Yeti container
FROM python:3.10 AS yeti

# 设置时区为中国标准时间
ENV TZ Asia/Shanghai

# Python
RUN apt-get update && apt-get install -y \
    python3-pip \
    libmagic-dev \
    git \
    && apt-get clean && rm -rf /var/cache/apt/* /var/lib/apt/lists/*

COPY ./yeti /app
WORKDIR /app
#RUN cp yeti.conf.sample yeti.conf
RUN cp ./extras/docker/docker-entrypoint.sh /docker-entrypoint.sh

# Upgrade pip
RUN pip3 install --upgrade pip && pip3 install poetry

# Install yeti
RUN poetry install --no-root --with plugins

ENV PYTHONPATH /app

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["webserver"]
