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
COPY --from=frontend-builder /app/dist /www
EXPOSE 80
