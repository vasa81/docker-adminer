FROM alpine:3.5
MAINTAINER Vaclav Kral <vasa81@gmail.com>
LABEL version="4.3.0.1"

EXPOSE 80

RUN apk update && apk add \
    ca-certificates \
    bash \
    nginx \
    php7-fpm \
    php7-gd \
    php7-iconv \
    php7-json \
    php7-mcrypt \
    php7-mysqli \
    php7-openssl \
    php7-pdo \
    php7-pdo_mysql \
    php7-phar \
    php7-session \
    php7-xml \
    php7-zlib

ADD files/adminer-4.3.0.php /var/www/adminer.php
ADD files/nginx.conf /etc/nginx/
ADD files/php-fpm.conf /etc/php/

ADD files/run.sh /
RUN chmod +x /run.sh

CMD ["/run.sh"]
