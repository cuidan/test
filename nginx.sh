#!/bin/sh
groupadd -g 27 nginx
useradd -g  nginx nginx 
usermod -u 27 nginx 
mkdir -p /var/tmp/nginx/proxy
cd /mnt
yum insatll -y  pcre-devel-7.8-7.el6.i686.rpm
openssl-devel-1.0.1e-57.el6.x86_64.rpm  zlib-devel-1.2.3-29.el6.x86_64.rpm
tar zxf nginx-1.9.12.tar.gz  
cd nginx-1.9.12/
./configure --prefix=/usr/local/nginx --conf-path=/etc/nginx/nginx.conf --sbin-path=/usr/sbin/nginx --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --user=nginx --group=nginx --with-http_ssl_module --with-http_flv_module --http-proxy-temp-path=/var/tmp/nginx/proxy --without-http_rewrite_module 
nginx 
chkconfig nginx on
