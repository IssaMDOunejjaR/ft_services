FROM alpine

RUN apk update && apk upgrade
RUN apk add openrc influxdb supervisor

RUN apk add telegraf --update --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

COPY /srcs/influxdb.conf /etc/
COPY /srcs/supervisord.conf /etc/

RUN openrc
RUN touch /run/openrc/softlevel

CMD /usr/bin/supervisord -c /etc/supervisord.conf

EXPOSE 8086