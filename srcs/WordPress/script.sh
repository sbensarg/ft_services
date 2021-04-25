eval $(minikube docker-env)
docker build -t wordpress .
kubectl apply -f wordpress.yaml
kubectl apply -f service_wordpress.yaml
minikube dashboard
