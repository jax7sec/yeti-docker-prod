FROM arangodb:3.11.8

# 创建非 root 用户和用户组
RUN addgroup -S arangodb && adduser -S -G arangodb arangodb

# 创建并设置目录权限
RUN mkdir -p /var/tmp/arangodb3 /var/run/arangodb3 /var/lib/arangodb3-apps /var/log/arangodb3 \
    && chown -R arangodb:arangodb /var/lib/arangodb3 \
    && chown -R arangodb:arangodb /var/lib/arangodb3-apps \
    && chown -R arangodb:arangodb /var/log/arangodb3 \
    && chown -R arangodb:arangodb /var/tmp/arangodb3 \
    && chown -R arangodb:arangodb /var/run/arangodb3

# 切换到非root用户
USER arangodb

# 启动 arangodb 服务
CMD ["arangod"]
