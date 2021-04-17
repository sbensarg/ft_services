# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbensarg <sbensarg@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/15 13:22:14 by sbensarg          #+#    #+#              #
#    Updated: 2021/04/17 15:13:28 by sbensarg         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.11
COPY . .
RUN chmod +x install.sh
RUN ./install.sh
EXPOSE 3306
RUN chmod +x start.sh
CMD  tail -f /dev/null