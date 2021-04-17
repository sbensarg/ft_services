# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbensarg <sbensarg@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/13 16:21:57 by sbensarg          #+#    #+#              #
#    Updated: 2021/04/17 15:49:57 by sbensarg         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash
apk update
apk add openrc
openrc default
rc-update add mariadb default
apk add mariadb mariadb-common mariadb-client
/etc/init.d/mariadb setup
chown -R mysql: /var/lib/mysql

# mv database.sql .
# mysql -u root < database.sql
# rm database.sql

# cat /etc/mysql/my.cnf "datadir=/var/lib/mysql" > /etc/mysql/my.cnf