eval $(minikube docker-env)
docker build -t nginx .
kubectl apply -f nginx.yaml
kubectl apply -f service.yaml
minikube dashboard
