Install and configure nginx web server on alpine linux
 
https://www.osetc.com/en/how-to-install-and-configure-nginx-web-server-on-alpine-linux.html

export MINIKUBE_HOME=/goinfre/sbensarg/
docker build -t nginx .
minikube ip
kubectl apply -f ../..metallb.yaml
kubectl apply -f nginx.yaml
kubectl apply -f service.yaml
Minikube dashboard
kubectl delete deployment nginx-deployment
/************************************************/
steps to deploy a sample app to minikube 
* create a minikube cluster
$ export MINIKUBE_HOME=/goinfre/sbensarg/
$ minikube start --vm-driver=virtualbox --disk-size=5GB
$ minikube dashboard

* Create a deployment
-Deployments are the recommended way to manage the creation and scaling of Pods.
-Deployment checks on the health of your Pod and restarts the Pod's Container if it terminates.
-Pod is a group of one or more Containers, tied together for the purposes of administration and networking.
-to create a Deployment that manages a Pod, we need to create object using the declarative object configuration file(yaml file) using kubectl apply -f <directory>.
- the pod runs a container based on docker image.

$ eval $(minikube docker-env)
$ docker build -t nginx .
$ kubectl apply -f nginx.yaml

* Create a Service
By default, the Pod is only accessible by its internal IP address within the Kubernetes cluster.
To make the deployment accessible from outside the Kubernetes virtual network, we need to expose the Pod as a Kubernetes Service.

$ kubectl apply -f service.yaml

type=LoadBalancer : indicates that you want to expose your Service outside of the cluster.
- to view the service created:  $kubectl get services.

MetalLB is a Kubernetes-aware solution that will monitor for services with the type LoadBalancer and assign them an IP address from a virtual pool.
It uses BGP(Border Gateway Protocol) or Layer 2 (with ARP Address Resolution Protocol) to expose services.

The minikube tool includes a set of built-in addons that can be enabled, disabled and opened in the local Kubernetes environment that include metallb addon.
to enable it : $ minikube addons enable metallb 
               $ minikube addons list
and next step is to create and deploy a configmap into the same namespace (metallb-system) as the deployment, by using Layer 2 mode is he simplest to configure, we don't need any protocol-specific configuration , only IP addresses.
$ minikube ip
$ kubectl apply -f ../../metallb.yaml

$ minikube service nginx-service




            





















