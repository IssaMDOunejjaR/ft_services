#! /bin/sh

minikube stop
minikube delete
minikube start

eval $(minikube docker-env)

# Build images
docker build -t my_nginx srcs/nginx
docker build -t my_wordpress srcs/wordpress
docker build -t my_phpmyadmin srcs/phpmyadmin
docker build -t my_grafana srcs/grafana
docker build -t my_mysql srcs/mysql
docker build -t my_influxdb srcs/influxdb
docker build -t my_ftps srcs/ftps

# Apply MetalLb Yaml File
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/metallb.yaml

# Apply Yaml Files
kubectl apply -f srcs/nginx/
kubectl apply -f srcs/wordpress/
kubectl apply -f srcs/phpmyadmin/
kubectl apply -f srcs/grafana/
kubectl apply -f srcs/mysql/
kubectl apply -f srcs/influxdb/
kubectl apply -f srcs/ftps/

minikube stop
minikube start
eval $(minikube docker-env)
minikube dashboard