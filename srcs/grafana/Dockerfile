FROM alpine

FROM alpine

RUN apk update && apk upgrade
RUN apk add vim
RUN apk add openrc --no-cache
RUN apk add nginx
COPY srcs/nginx.conf /etc/nginx/
COPY /srcs/index.html /www/
RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.3.2.linux-amd64.tar.gz
RUN tar -zxvf grafana-enterprise-7.3.2.linux-amd64.tar.gz
RUN openrc
RUN touch /run/openrc/softlevel