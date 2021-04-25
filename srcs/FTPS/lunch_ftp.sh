eval $(minikube docker-env)
docker build -t ftp .
kubectl apply -f ftp.yaml
kubectl apply -f service_ftp.yaml
minikube dashboard

