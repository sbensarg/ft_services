

#!/bin/bash
apk add openrc
openrc default
echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
# wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.5.5.linux-amd64.tar.gz
# tar -zxvf grafana-enterprise-7.5.5.linux-amd64.tar.gz
apk update && apk upgrade
apk add grafana
rc-update add grafana default

#-------------add telegraf---------------#
# echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
# apk update && apk upgrade
apk --no-cache add telegraf
rc-update add telegraf default
mkdir -p /etc/telegraf
mv /telegraf.conf /etc/telegraf/telegraf.conf