FROM alpine

RUN apk update && apk upgrade
RUN apk add openrc mysql mysql-client supervisor

COPY /srcs/ /tmp
COPY /srcs/my.cnf /etc/
RUN mkdir /run/mariadb
COPY /srcs/supervisord.conf /etc/

RUN openrc
RUN touch /run/openrc/softlevel
RUN /etc/init.d/mariadb setup
RUN sh /tmp/setup.sh

CMD /usr/bin/supervisord -c /etc/supervisord.conf