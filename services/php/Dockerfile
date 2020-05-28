ARG PHP_VERSION
FROM php:${PHP_VERSION}

ARG TZ
ARG ALPINE_MIRRORS
ARG PHP_EXTENSIONS

# 修改 Apline 镜像源,安装php基本扩展
# sed -i "s/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g" /etc/apk/repositories
RUN sed -i "s/dl-cdn.alpinelinux.org/${ALPINE_MIRRORS}/g" /etc/apk/repositories \
    && apk update

COPY install.sh /temp/extensions/
WORKDIR /temp/extensions
RUN chmod +x install.sh \
    && sh install.sh \
    && rm -rf /tmp/extensions

# 修改时区
RUN apk --no-cache add tzdata \
    && cp "/usr/share/zoneinfo/${TZ}" /etc/localtime \
    && echo "${TZ}" > /etc/timezone \
    && apk del tzdata

# 安装 composer
RUN curl -o /usr/bin/composer https://mirrors.aliyun.com/composer/composer.phar \
    && chmod +x /usr/bin/composer
ENV COMPOSER_HOME=/tmp/composer

# 安装 mysqli redis 等基本扩展 


# 修改php所属用户为普通用户
RUN apk --no-cache add shadow && usermod -u 1000 www-data && groupmod -g 1000 www-data

WORKDIR /www