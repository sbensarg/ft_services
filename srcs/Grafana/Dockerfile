# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbensarg <sbensarg@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/15 13:22:14 by sbensarg          #+#    #+#              #
#    Updated: 2021/05/23 16:51:19 by sbensarg         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.11
COPY . .
RUN chmod +x install.sh
RUN ./install.sh
EXPOSE 3000
RUN chmod +x start.sh
COPY ./grafana.db ./grafana/data/
CMD  ./start.sh && tail -f /dev/null