minikube start --insecure-registry=192.168.64.0/24 --cpus=4 --memory=8g --vm


minikube addons enable ingress
minikube addons enable ingress-dns

# Install operator
kubectl apply -k "github.com/eduk8s/eduk8s?ref=master"

# Capture minikube ip
IP=$(minikube ip)

# Configure operator with domain name
kubectl set env deployment/eduk8s-operator -n eduk8s INGRESS_DOMAIN=$IP.nip.io

# If working with large images configure nginx add `proxy-body-size: 1g` in data section:
#  kubectl edit configmap nginx-load-balancer-conf -n kube-system

# Show if if above worked
kubectl get all -n eduk8s  

# deploy workshop definition
kubectl apply -f ./resources/workshop.yaml


# deploy training portal 
kubectl apply -f ./resources/training-portal.yaml

# Get trainingportals, will have to 
kubectl get trainingportal --watch
