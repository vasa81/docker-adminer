#!/usr/bin/env bash
php-fpm7

mkdir -p /tmp/nginx
chown nginx /tmp/nginx
chown nginx /var/www
nginx
