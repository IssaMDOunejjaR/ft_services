FROM alpine

RUN apk update && apk upgrade
RUN apk add vim
RUN apk add openrc --no-cache
RUN apk add mysql mysql-client
COPY test.php .
RUN openrc
RUN touch /run/openrc/softlevel
RUN /etc/init.d/mariadb setup