


rc-service influxdb start
#rc-service telegraf start
 telegraf /etc/telegraf/telegraf.conf &


# influx -execute "CREATE DATABASE grafana_db"
# influx -execute "CREATE USER admin WITH PASSWORD 'admin123' WITH ALL PRIVILEGES"
# influx -execute "GRANT ALL ON grafana_db TO admin"
# curl -XPOST "http://localhost:8086/query" --data-urlencode "q=CREATE DATABASE sara"



