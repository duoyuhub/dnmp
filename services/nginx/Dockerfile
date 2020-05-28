ARG NGINX_VERSION
FROM nginx:${NGINX_VERSION}

ARG TZ
ARG ALPINE_MIRRORS
ARG NGINX_INSTALL_CERTBOT

# 修改 Apline 镜像源
RUN if [ "${ALPINE_MIRRORS}" != "" ]; then \
        sed -i "s/dl-cdn.alpinelinux.org/${ALPINE_MIRRORS}/g" /etc/apk/repositories; \
        apk update; \
    fi

# 修改时区
RUN apk add --no-cache tzdata \
    && cp "/usr/share/zoneinfo/${TZ}" /etc/localtime \
    && echo "${TZ}" > /etc/timezone \
    && apk del tzdata


# 安装 certbot 证书认证
RUN if [ "${NGINX_INSTALL_CERTBOT}" = true ]; then \
        echo "---------- Install certbot ----------"; \
        apk add --no-cache certbot; \
    fi

WORKDIR /www