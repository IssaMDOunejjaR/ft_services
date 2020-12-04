FROM alpine

RUN apk update && apk upgrade
RUN apk add openrc mysql mysql-client

COPY /srcs/test.php .

RUN openrc
RUN touch /run/openrc/softlevel
RUN /etc/init.d/mariadb setup