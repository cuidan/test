#!/bin/bash
install(){
	yum install -y ansible
}

[ -x  /usr/bin/ansible ] || install

echo -e "
[webserver]\nweb-server-1  ansible_ssh_host=10.0.0.194 ansible_ssh_port=22 ansible_user=root ansible_ssh_pass=123456\nweb-server-2  ansible_ssh_host=10.0.0.195 ansible_ssh_port=22 ansible_user=root ansible_ssh_pass=123456\nweb-server-3  ansible_ssh_host=119.23.11.144 ansible_ssh_port=22 ansible_user=root ansible_ssh_pass=cdlz102345-" >>   /etc/ansible/hosts
#ansible webserver -m shell -a "mkdir -p /usr/local/nginx "
#ansible webserver -m yum -a "name=redis state=latest "
#ansible webserver -m yum -a 'name="pcre-devel,zlib,zlib-devel,pcre,gcc,gcc-c++" state=latest'
#ansible webserver -m copy -a 'src=/mnt/nginx-1.9.12.tar.gz dest=/tmp/'
#ansible webserver -m unarchive -a "src=/tmp/nginx-1.9.12.tar.gz dest=/mnt/ copy=no"
#ansible webserver -m shell -a "id nginx &> /dev/null"
#if [ $? -ne 0 ] ;then
#	ansible webserver -m shell -a "useradd nginx"
#fi

#ansible webserver -m shell -a "cd /mnt/nginx-1.9.12"
#ansible webserver -m shell -a "cd /mnt/nginx-1.9.12 && ./configure \ 
#--prefix=/usr/local/nginx \
#--sbin-path=/usr/local/nginx \
#--conf-path=/usr/local/nginx/nginx.conf \
#--error-log-path=/var/log/nginx/error.log \
#--user=nginx \
#--group=nginx \
#--without-http_rewrite_module
#"
#ansible webserver -m shell -a "cd /mnt/nginx-1.9.12 && make"
#ansible webserver -m shell -a "cd /mnt/nginx-1.9.12 && make install"
ansible webserver -m script  -a "install.nginx.sh"
exit
ansible webserver -m copy  -a "src=/etc/init.d/nginx dest=/etc/init.d/nginx mode=0755"
#ansible webserver -m shell -a "chmod +x /etc/init.d/nginx"
ansible webserver -m shell -a "service nginx start"
