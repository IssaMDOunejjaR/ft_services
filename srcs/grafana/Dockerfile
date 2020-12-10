FROM alpine

RUN apk update && apk upgrade
RUN apk add openrc libc6-compat supervisor

RUN apk add telegraf --update --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.3.2.linux-amd64.tar.gz
RUN tar -zxvf grafana-enterprise-7.3.2.linux-amd64.tar.gz 
RUN mv grafana-7.3.2 grafana
RUN rm -rf grafana-enterprise-7.3.2.linux-amd64.tar.gz

COPY /srcs/grafana.db /grafana/data/
COPY /srcs/influxdb.conf .
COPY /srcs/supervisord.conf /etc/

RUN openrc
RUN touch /run/openrc/softlevel

CMD /usr/bin/supervisord -c /etc/supervisord.conf

EXPOSE 3000