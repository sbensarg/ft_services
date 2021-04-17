eval $(minikube docker-env)
docker build -t mysql .
kubectl apply -f mysql.yaml
kubectl apply -f service_mysql.yaml
minikube dashboard

