# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbensarg <sbensarg@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/13 16:21:57 by sbensarg          #+#    #+#              #
#    Updated: 2021/05/23 16:31:15 by sbensarg         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

#ftp server
apk update && apk upgrade
apk add vsftpd
apk add openssl
mkdir -p /etc/ssl/private/
openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout /etc/ssl/private/vsftpd.private.key.pem -out /etc/ssl/private/vsftpd.cert.pem -subj "/C=MA/ST=BENG/L=BENG/O=LEET/CN=FTPS"
mv /vsftpd.conf /etc/vsftpd/vsftpd.conf
# adduser sbensarg -D 
# echo "sbensarg:qwert123" | chpasswd
addgroup sbensarg
adduser -D -G sbensarg -h /home/sbensarg -s /bin/false sbensarg
echo "sbensarg:sbensarg" | /usr/sbin/chpasswd
chown sbensarg:sbensarg /home/sbensarg/ -R
#-------------add telegraf---------------#
echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
apk update && apk upgrade
apk --no-cache add telegraf
mkdir -p /etc/telegraf
mv /telegraf.conf /etc/telegraf/