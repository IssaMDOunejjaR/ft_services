FROM alpine

RUN apk update && apk upgrade
RUN apk add vim
RUN apk add openrc --no-cache
RUN apk add vsftpd
RUN apk add lftp
RUN openrc
RUN touch /run/openrc/softlevel