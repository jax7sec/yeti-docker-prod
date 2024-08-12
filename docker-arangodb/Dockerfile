
# 基于官方 ArangoDB 镜像
FROM arangodb:3.11.8

# 安装必要的工具来创建用户和组
RUN apt-get update && apt-get install -y \
    passwd \
    && rm -rf /var/lib/apt/lists/*
    
# 设置环境变量
ENV ARANGO_ROOT_PASSWORD=${ARANGO_ROOT_PASSWORD:-root}

# 创建一个新的非 root 用户和组
RUN groupadd -r arangod && useradd -r -g arangod arangod

# 确保数据目录和日志目录的权限正确
RUN mkdir -p /var/lib/arangodb3 && \
    mkdir -p /var/log/arangodb && \
    chown -R arangod:arangod /var/lib/arangodb3 /var/log/arangodb

# 切换到非 root 用户
USER arangod

# 将工作目录设置为 ArangoDB 数据目录
WORKDIR /var/lib/arangodb3

# 暴露默认的 ArangoDB 端口
EXPOSE 8529