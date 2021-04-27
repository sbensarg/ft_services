eval $(minikube docker-env)
docker build -t ftps .
kubectl apply -f ftps.yaml
kubectl apply -f service_ftps.yaml
minikube dashboard

