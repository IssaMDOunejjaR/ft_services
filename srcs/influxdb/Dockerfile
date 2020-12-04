FROM alpine

RUN apk update && apk upgrade
RUN apk add openrc influxdb

RUN openrc
RUN touch /run/openrc/softlevel