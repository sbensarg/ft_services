eval $(minikube docker-env)
docker build -t phpmyadmin .
kubectl apply -f phpmyadmin.yaml
kubectl apply -f service_phpmyadmin.yaml
minikube dashboard
