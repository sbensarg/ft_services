eval $(minikube docker-env)
docker build -t grafana .
kubectl apply -f grafana.yaml
kubectl apply -f service_grafana.yaml
minikube dashboard
