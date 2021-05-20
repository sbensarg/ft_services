wget https://dl.grafana.com/oss/release/grafana-7.5.5.linux-amd64.tar.gz
tar -zxvf grafana-7.5.5.linux-amd64.tar.gz
mv grafana-7.5.5 grafana
apk update && apk add libc6-compat


#-------------add telegraf---------------#
echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
apk update && apk upgrade
apk --no-cache add telegraf
mkdir -p /etc/telegraf
mv /telegraf.conf /etc/telegraf/telegraf.conf