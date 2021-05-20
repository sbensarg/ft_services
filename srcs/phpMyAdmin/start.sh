# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbensarg <sbensarg@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/13 16:23:06 by sbensarg          #+#    #+#              #
#    Updated: 2021/05/20 18:35:46 by sbensarg         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

rc-service nginx start
rc-service php-fpm7 start
telegraf /etc/telegraf/telegraf.conf &
