# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbensarg <sbensarg@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/13 16:23:06 by sbensarg          #+#    #+#              #
#    Updated: 2021/04/30 17:00:39 by sbensarg         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash


rc-service vsftpd start
vsftpd /etc/vsftpd/vsftpd.conf &

rc-service influxdb start
telegraf /etc/telegraf/telegraf.conf &
