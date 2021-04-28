eval $(minikube docker-env)
docker build -t influxdb .
kubectl apply -f influxdb.yaml
kubectl apply -f service_influxdb.yaml
minikube dashboard

