# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbensarg <sbensarg@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/13 16:21:57 by sbensarg          #+#    #+#              #
#    Updated: 2021/04/21 17:34:48 by sbensarg         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash
apk update
apk add openrc
openrc default
apk add mariadb mariadb-common mariadb-client
rc-update add mariadb default
/etc/init.d/mariadb setup

#rm database.sql

# cat /etc/mysql/my.cnf "datadir=/var/lib/mysql" > /etc/mysql/my.cnf