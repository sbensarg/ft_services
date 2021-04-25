# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbensarg <sbensarg@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/13 16:21:57 by sbensarg          #+#    #+#              #
#    Updated: 2021/04/22 13:50:54 by sbensarg         ###   ########.fr        #
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


#rm database.sql

# cat /etc/mysql/my.cnf "datadir=/var/lib/mysql" > /etc/mysql/my.cnf