FROM alpine

RUN apk update && apk upgrade
RUN apk add openrc libc6-compat supervisor

RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.3.2.linux-amd64.tar.gz
RUN tar -zxvf grafana-enterprise-7.3.2.linux-amd64.tar.gz 
RUN mv grafana-7.3.2 grafana
RUN rm -rf grafana-enterprise-7.3.2.linux-amd64.tar.gz
COPY /srcs/grafana.db /grafana/data/
COPY /srcs/influxdb.conf .

RUN openrc
RUN touch /run/openrc/softlevel

EXPOSE 3000