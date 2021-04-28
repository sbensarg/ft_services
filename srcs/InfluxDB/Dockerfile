# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbensarg <sbensarg@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/15 13:22:14 by sbensarg          #+#    #+#              #
#    Updated: 2021/04/28 16:19:19 by sbensarg         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.11
COPY . .
RUN chmod +x install.sh
RUN ./install.sh
EXPOSE 8086
RUN chmod +x start.sh
CMD ./start.sh && tail -f /dev/null