minikube config set memory 3072
minikube delete
minikube start --vm-driver virtualbox --disk-size 20GB
minikube addons enable metallb
kubectl apply -f srcs/metallb.yaml

eval $(minikube docker-env)

#mysql
docker build -t mysql srcs/MySQL/.
kubectl apply -f srcs/MySQL/mysql.yaml
kubectl apply -f srcs/MySQL/service_mysql.yaml
#phpmyadmin
docker build -t phpmyadmin srcs/phpMyAdmin/.
kubectl apply -f srcs/phpMyAdmin/phpmyadmin.yaml
kubectl apply -f srcs/phpMyAdmin/service_phpmyadmin.yaml
#wordpress
docker build -t wordpress srcs/WordPress/.
kubectl apply -f srcs/WordPress/wordpress.yaml
kubectl apply -f srcs/WordPress/service_wordpress.yaml
#ngnix
docker build -t nginx srcs/Nginx/.
kubectl apply -f srcs/Nginx/nginx.yaml
kubectl apply -f srcs/Nginx/service.yaml
#ftp
docker build -t ftps srcs/FTPS/.
kubectl apply -f srcs/FTPS/ftps.yaml
kubectl apply -f srcs/FTPS/service_ftps.yaml

#influxdb
docker build -t influxdb srcs/InfluxDB/.
kubectl apply -f srcs/InfluxDB/influxdb.yaml
kubectl apply -f srcs/InfluxDB/service_influxdb.yaml

#grafana
docker build -t grafana srcs/Grafana/.
kubectl apply -f srcs/Grafana/grafana.yaml
kubectl apply -f srcs/Grafana/service_grafana.yaml


minikube dashboard