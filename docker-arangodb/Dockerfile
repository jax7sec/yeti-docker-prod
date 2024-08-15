FROM arangodb:3.11.8

# 创建与宿主机上相同 UID 和 GID 的用户和用户组
RUN addgroup -g 6000 -S app && adduser -u 6001 -S -G app -h /home/app app

# 创建并设置目录权限
RUN mkdir -p /var/tmp/arangodb3 /var/run/arangodb3 /var/lib/arangodb3-apps /var/log/arangodb3 \
    && chown -R app:app /var/lib/arangodb3 \
    && chown -R app:app /var/lib/arangodb3-apps \
    && chown -R app:app /var/log/arangodb3 \
    && chown -R app:app /var/tmp/arangodb3 \
    && chown -R app:app /var/run/arangodb3

# 切换到非 root 用户
USER app

# 启动 arangodb 服务
CMD ["arangod"]
