
#!/bin/bash

apk update
apk add openrc
apk add curl
openrc default
echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
apk update && apk upgrade
apk --no-cache add influxdb telegraf
rc-update add influxdb default
mkdir -p /etc/telegraf
mv telegraf.conf /etc/telegraf/