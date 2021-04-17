# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbensarg <sbensarg@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/13 16:21:57 by sbensarg          #+#    #+#              #
#    Updated: 2021/04/17 15:43:21 by sbensarg         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

#install the Nginx web server
apk update && apk upgrade 
apk add nginx
apk add openrc
openrc default
apk add php7 php7-fpm php7-opcache
apk add php7-gd php7-mysqli php7-zlib php7-curl
rc-update add php-fpm7 default
rc-update add nginx default
mv default.conf /etc/nginx/conf.d
# chmod 777 index.php
# mv index.php /var/www/localhost/htdocs

wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-english.zip
unzip phpMyAdmin-4.9.0.1-english.zip
mv phpMyAdmin-4.9.0.1-english/ /usr/share/phpMyAdmin
rm phpMyAdmin-4.9.0.1-english.zip
cp -pr /usr/share/phpMyAdmin/config.sample.inc.php /usr/share/phpMyAdmin/config.inc.php
cp config.inc.php /usr/share/phpMyAdmin/
mkdir /usr/share/phpMyAdmin/tmp
chmod 777 /usr/share/phpMyAdmin/tmp
chown -R www-data:www-data /usr/share/phpMyAdmin
# mv start.sh /root
# bash start.sh
rc-service nginx start
rc-service php-fpm7 start
#mysql -u root < phpmyadmin/sql/create_tables.sql
# mkdir tmp
# chmod 777 tmp
# mv database.sql .
# mysql -u root < database.sql
# rm database.sql