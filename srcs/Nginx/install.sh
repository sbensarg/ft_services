# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbensarg <sbensarg@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/13 16:21:57 by sbensarg          #+#    #+#              #
#    Updated: 2021/05/20 18:34:47 by sbensarg         ###   ########.fr        #
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
mkdir /etc/nginx/ssl
mv /localhost.pem /etc/nginx/ssl
mv /localhost-key.pem /etc/nginx/ssl
#ssh
apk add openssh
mv /sshd_config /etc/ssh/sshd_config
adduser sbensarg -D
echo "sbensarg:azerty123" | chpasswd

#-------------add telegraf---------------#
echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
apk update && apk upgrade
apk --no-cache add telegraf
mkdir -p /etc/telegraf
mv telegraf.conf /etc/telegraf/
