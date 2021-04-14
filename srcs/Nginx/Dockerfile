# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbensarg <sbensarg@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/13 16:01:20 by sbensarg          #+#    #+#              #
#    Updated: 2021/04/14 16:08:24 by sbensarg         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.11
COPY . .
RUN chmod +x install.sh
RUN ./install.sh
EXPOSE 443
EXPOSE 80
RUN chmod +x start.sh
CMD  ./start.sh && tail -f /dev/null