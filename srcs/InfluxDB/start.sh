# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: chicky <chicky@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/13 16:23:06 by sbensarg          #+#    #+#              #
#    Updated: 2021/04/29 16:46:01 by chicky           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

rc-service influxdb start
rc-service telegraf start


influx -execute "CREATE DATABASE grafana_db"
influx -execute "CREATE USER admin WITH PASSWORD 'admin123' WITH ALL PRIVILEGES"
influx -execute "GRANT ALL ON grafana_db TO admin"
