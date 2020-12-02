#! /bin/sh

docker build -t my_nginx srcs/nginx
docker build -t my_wordpress srcs/nginx