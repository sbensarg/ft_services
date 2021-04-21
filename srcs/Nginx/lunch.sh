eval $(minikube docker-env)
docker build -t mynginx .
kubectl apply -f nginx.yaml
kubectl apply -f service.yaml
minikube dashboard
