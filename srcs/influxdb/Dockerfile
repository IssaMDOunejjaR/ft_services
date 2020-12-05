FROM alpine

RUN apk update && apk upgrade
RUN apk add openrc influxdb

COPY /srcs/influxdb.conf /etc/

RUN openrc
RUN touch /run/openrc/softlevel