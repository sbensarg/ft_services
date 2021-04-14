# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbensarg <sbensarg@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/13 16:21:57 by sbensarg          #+#    #+#              #
#    Updated: 2021/04/14 16:52:14 by sbensarg         ###   ########.fr        #
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
# cd /etc/ngnix/conf.d
# vim default.conf
# cd /home/mynginx
# vim index.html
chown -R u1:u1 home
# rc-service nginx restart


# mv www.mytest.com.conf /etc/nginx/conf.d/