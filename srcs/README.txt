Exemple: docker run --name test -it debian

docker run -d -p 80:80 docker/getting-started

-d : run the container in detached mode (in the background)
-p 80:80 - map port 80 of the host to port 80 in the container
docker/getting-started - the image to use

Run container named test using the Debian:latest image , -it : keep the skin open even if not attached and allocate pseudo 

Docker image build : build image from Dockerfile

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


* Un cluster Kubernetes est un ensemble de machines (les nœuds) qui permettent d'exécuter des applications conteneurisées.
* minikube is a tool that lets you run Kubernetes locally.

steps to deploy a sample app to minikube 
* create a minikube cluster
$ export MINIKUBE_HOME=/goinfre/sbensarg/
$ minikube start --vm-driver=virtualbox --disk-size=5GB --memory 5000
$ minikube dashboard

* Create a deployment
-Deployments are the recommended way to manage the creation and scaling of Pods.
-Deployment checks on the health of your Pod and restarts the Pod's Container if it terminates.
-Pod is a group of one or more Containers, tied together for the purposes of administration and networking.
-to create a Deployment that manages a Pod, we need to create object using the declarative object configuration file(yaml file) using kubectl apply -f <directory>.
-the pod runs a container based on docker image.

$ eval $(minikube docker-env)
$ docker build -t nginx .
$ kubectl apply -f nginx.yaml

* Create a Service
By default, the Pod is only accessible by its internal IP address within the Kubernetes cluster.
To make the deployment accessible from outside the Kubernetes virtual network, we need to expose the Pod as a Kubernetes Service.

$ kubectl apply -f service.yaml

type=LoadBalancer : indicates that you want to expose your Service outside of the cluster.
- to view the service created:  $kubectl get services.
ClusterIP : Exposes the Service on a cluster-internal IP. Choosing this value makes the Service only reachable from within the cluster. This is the default ServiceType

MetalLB is a Kubernetes-aware solution that will monitor for services with the type LoadBalancer and assign them an IP address from a virtual pool.
It uses BGP(Border Gateway Protocol) or Layer 2 (with ARP Address Resolution Protocol) to expose services.

The minikube tool includes a set of built-in addons that can be enabled, disabled and opened in the local Kubernetes environment that include metallb addon.
to enable it : $ minikube addons enable metallb 
               $ minikube addons list
and next step is to create and deploy a configmap into the same namespace (metallb-system) as the deployment, by using Layer 2 mode is he simplest to configure, we don't need any protocol-specific configuration , only IP addresses.
$ minikube ip
$ kubectl apply -f ../../metallb.yaml

$ minikube service nginx-service

copy file from deployment to local
kubectl exec deploy/phpmyadmin-deployment cat /www/phpmyadmin/sql/create_tables.sql > ../MySQL/create_tables.sql
vboxmanage modifyvm "minikube" --memory 5000


* Le stockage persistant est tout périphérique de stockage de données qui conserve
les données après la mise hors tension de ce périphérique.

* PersistentVolume (PV)

Les PV sont des ressources du cluster
qui ont un cycle de vie indépendant
de tout pod individuel utilisant un PV.
Il s'agit du volume "physique" sur la machine
hôte qui stocke les données persistantes.
PersistentVolumes fournit des ressources
de stockage dans un cluster, ce qui permet à la ressource
de stockage de persister même lorsque les pods qui les
utilisent sont cyclés. Les volumes persistants peuvent 
être provisionnés de manière statique ou dynamique,
et ils peuvent être personnalisés pour une utilisation
en définissant des propriétés telles que les performances,
la taille et le mode d'accès.

* PersistentVolumeClaim (PVC)

 Les PVC sont des demandes de ressources
 qui agissent comme des contrôles de
 réclamation pour la ressource.
 Un PVC est une demande de la plate-forme
 pour créer un PersistentVolume
 et pour attacher des PV aux pods via un PVC.

* Verify that a PersistentVolume got dynamically provisioned.

$kubectl get pvc



            





















