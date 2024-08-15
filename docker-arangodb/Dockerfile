FROM arangodb:3.11.8

# 创建非 root 用户和用户组
RUN addgroup -S arangodb && adduser -S -G arangodb arangodb

# 设置 ArangoDB 目录的权限
RUN chown -R arangodb:arangodb /var/lib/arangodb3 \
    && chown -R arangodb:arangodb /var/lib/arangodb3-apps \
    && chown -R arangodb:arangodb /var/log/arangodb3 \
    && chown -R arangodb:arangodb /var/tmp/arangodb3 \
    && chown -R arangodb:arangodb /var/run/arangodb3

# 切换到非 root 用户
USER arangodb

# 使用入口脚本运行 ArangoDB
ENTRYPOINT ["/entrypoint.sh"]
