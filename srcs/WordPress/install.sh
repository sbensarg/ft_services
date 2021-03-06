# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbensarg <sbensarg@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/13 16:21:57 by sbensarg          #+#    #+#              #
#    Updated: 2021/05/23 11:34:10 by sbensarg         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

apk add nginx
apk add openrc
openrc default
#create the user named u1 and Ngnix directory
adduser -g 'Nginx www user' -h /www www -D
# Nginx configuration
# create a virtual hosts configuration file of Nginx server
apk add unit unit-php7 
apk add php7 php7-fpm php7-mysqli php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-phar php7-json php7-mbstring php7-session
rc-update add php-fpm7 default
rc-update add nginx default
mv default.conf /etc/nginx/conf.d
chown -R www:www /www

#installing and configuring wordpress
cd /www
wget http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
rm latest.tar.gz
mv /wp-config.php wordpress
chown -R www:www /www/wordpress

#-------------add telegraf---------------#
echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
apk update && apk upgrade
apk --no-cache add telegraf
mkdir -p /etc/telegraf
mv /telegraf.conf /etc/telegraf/telegraf.conf
