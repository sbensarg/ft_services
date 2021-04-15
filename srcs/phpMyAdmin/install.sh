# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbensarg <sbensarg@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/13 16:21:57 by sbensarg          #+#    #+#              #
#    Updated: 2021/04/15 16:05:45 by sbensarg         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

#install the Nginx web server
apk update && apk upgrade 
apk add nginx
apk add openrc
openrc default
apk update && apk upgrade
apk add unit unit-php7 
apk add php7 php7-fpm php7-mysqli php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-phar php7-json php7-mbstring
rc-update add php-fpm7 default
rc-update add nginx default
mv default.conf /etc/nginx/conf.d
mv index.php /var/www/localhost/htdocs
