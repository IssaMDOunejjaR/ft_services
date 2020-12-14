FROM alpine

RUN apk update && apk upgrade
RUN apk add openrc mysql mysql-client supervisor

RUN apk add telegraf --update --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted

COPY /srcs/ /tmp
COPY /srcs/supervisord.conf /etc/
COPY /srcs/telegraf.conf /etc/

RUN openrc
RUN touch /run/openrc/softlevel
# RUN sh /tmp/setup.sh

# CMD /usr/bin/supervisord -c /etc/supervisord.conf
CMD sh /tmp/setup.sh

EXPOSE 3306