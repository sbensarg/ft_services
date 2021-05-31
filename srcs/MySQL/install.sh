# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbensarg <sbensarg@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/13 16:21:57 by sbensarg          #+#    #+#              #
#    Updated: 2021/05/23 16:31:07 by sbensarg         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash
apk update
apk add openrc --no-cache
openrc default
apk add mariadb mariadb-common mariadb-client
rc-update add mariadb default
/etc/init.d/mariadb setup
mv /mariadb-server.cnf etc/my.cnf.d/mariadb-server.cnf

#-------------add telegraf---------------#
echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
apk update && apk upgrade
apk --no-cache add telegraf
mkdir -p /etc/telegraf
mv /telegraf.conf /etc/telegraf/