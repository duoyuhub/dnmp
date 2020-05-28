#!/bin/sh
export MC="-j$(nproc)"

apk -u add --no-cache autoconf g++ libtool make curl-dev libxml2-dev linux-headers

echo "---------- Install mcrypt ----------"
apk add --no-cache libmcrypt-dev
pecl install mcrypt-1.0.3
docker-php-ext-enable mcrypt


echo "---------- Install redis ----------"
pecl install redis-5.1.1
docker-php-ext-enable redis


echo "---------- Install mongodb ----------"
pecl install mongodb-1.7.4 
docker-php-ext-enable mongodb


echo "---------- Install mysqli ----------"
docker-php-ext-install mysqli \
&& docker-php-ext-enable mysqli






