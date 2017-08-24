#!/bin/bash
mkdir -p /usr/local/nginx 
yum install -y redis pcre-devel zlib zlib-devel pcre gcc gcc-c++
id nginx ; [ $? = 0 ] || useradd nginx
exit

cd /mnt/nginx-1.9.12 && ./configure \ 
--prefix=/usr/local/nginx \
--sbin-path=/usr/local/nginx \
--conf-path=/usr/local/nginx/nginx.conf \
--error-log-path=/var/log/nginx/error.log \
--user=nginx \
--group=nginx \
--without-http_rewrite_module

cd /mnt/nginx-1.9.12 && make && make install
