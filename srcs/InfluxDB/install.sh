# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: chicky <chicky@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/13 16:21:57 by sbensarg          #+#    #+#              #
#    Updated: 2021/04/29 18:10:23 by chicky           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash
apk update
apk add openrc
openrc default
apk add influxdb
rc-update add influxdb default
apk add telegraf
rc-update add telegraf default
mkdir -p /etc/telegraf
mv telegraf.conf /etc/telegraf/