FROM alpine

RUN apk update && apk upgrade
RUN apk add openrc influxdb supervisor

RUN apk add telegraf --update --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted

COPY /srcs/setup.sh /tmp/
COPY /srcs/influxdb.conf /etc/
COPY /srcs/supervisord.conf /etc/
COPY /srcs/telegraf.conf /etc/

RUN openrc
RUN touch /run/openrc/softlevel
RUN sh /tmp/setup.sh

CMD /usr/bin/supervisord -c /etc/supervisord.conf

EXPOSE 8086