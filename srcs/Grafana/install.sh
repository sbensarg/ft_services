# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: chicky <chicky@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/13 16:21:57 by sbensarg          #+#    #+#              #
#    Updated: 2021/04/29 18:43:19 by chicky           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.5.5.linux-amd64.tar.gz
tar -zxvf grafana-enterprise-7.5.5.linux-amd64.tar.gz

apk update
apk add openrc
openrc default
apk add telegraf
rc-update add telegraf default
mkdir -p /etc/telegraf
mv telegraf.conf /etc/telegraf/