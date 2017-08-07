#!/bin/sh
sed -i 's/enforcing/disabled/g' /etc/selinux/config
/etc/init.d/iptables stop
sed -i 's/Port 22/Port 65422/g' /etc/ssh/sshd_config
cd
cp .ssh/authorized_keys /mnt
cat > .ssh/authorized_keys <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwHPXKnlGuXpygKiSsekfMk1a4vorTGMyU5I8QJoDWX0gejKkVurTx1A7V2GX4hb3UnuAsDaU8vUvWsKFJB8osudaxeG2n/cwyqRFK/4iM+VBPMgW0oX29J9+Vrme6NK3liU2V6vYkgmG1T6SjqsLwWcPWh2pILjEzoozywXvKQ4RTOcJOfL1zzW6Q96hHSjJe34DC2iXmRjj1eDkOkIo/dJGQl48un3EUQsMn0cQAAW+aTGSueqSJL5eR7rfrG64zsz4/Q2navuxw69Ox5Gd6a0ss4IiagdU7ZcaRVByTVWNKVAMRx6ggSeUogzR1dcYFL1Ist2X2ChOLh+7G7hK5 cuidan@cuidan-To-be-filled-by-O-E-M
                                           
EOF
/etc/init.d/sshd restart
cp -p /etc/yum.repos.d/CentOS-Base.repo /mnt/CentOS-Base.repo
echo -e "nameserver 114.114.114.114\n nameserver 8.8.8.8" > /etc/resolv.conf
yum install -y wget
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-6.repo
wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-6.repo
yum clean all
groupadd -g 27 nginx
useradd -g  nginx nginx
usermod -u 27 nginx
mkdir -p /var/tmp/nginx/proxy
yum install -y  pcre-devel-7.8-7.el6.i686.rpm openssl-devel-1.0.1e-57.el6.x86_64.rpm  zlib-devel-1.2.3-29.el6.x86_64.rpm
yum install -y gcc-c++ gcc
tar zxf nginx-1.9.12.tar.gz
cd nginx-1.9.12/
./configure --prefix=/usr/local/nginx --sbin-path=/usr/sbin/nginx --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --user=nginx --group=nginx --with-http_ssl_module --with-http_flv_module --http-proxy-temp-path=/var/tmp/nginx/proxy --without-http_rewrite_module
make
make install
              






