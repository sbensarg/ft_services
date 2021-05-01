# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbensarg <sbensarg@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/13 16:21:57 by sbensarg          #+#    #+#              #
#    Updated: 2021/04/30 16:26:33 by sbensarg         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

apk update 

#install the Nginx web server
apk add nginx
apk add openrc
openrc default
#create the user named u1 and Ngnix directory
adduser -g 'Nginx www user' -h /home/mynginx u1 -D
# Nginx configuration
# create a virtual hosts configuration file of Nginx server
mv default.conf /etc/nginx/conf.d
mv index.html /home/mynginx/
chown -R u1:u1 home

#install golang and libnss3-tools to use in mkcert which will be downloaded using git
# apk add go
# apk add libnss3-tools
# apk add git
#generatting ssl certinficats .pem using mkcert
# cd /root
# git clone https://github.com/FiloSottile/mkcert && cd mkcert
# go build -ldflags "-X main.Version=$(git describe --tags)"
# ./mkcert -install
# ./mkcert localhost
mkdir /etc/nginx/ssl
mv /localhost.pem /etc/nginx/ssl
mv /localhost-key.pem /etc/nginx/ssl

#ssh
apk add openssh
rc-update add sshd
/etc/init.d/sshd start
mv /sshd_config /etc/ssh/sshd_config
adduser sbensarg -D
echo "sbensarg:azerty123" | chpasswd

#-------------add telegraf---------------#
echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
apk update && apk upgrade
apk --no-cache add telegraf
rc-update add telegraf default
mkdir -p /etc/telegraf
mv telegraf.conf /etc/telegraf/
