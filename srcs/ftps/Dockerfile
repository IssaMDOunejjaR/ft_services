FROM alpine

RUN apk update && apk upgrade
RUN apk add openrc vsftpd lftp

RUN openrc
RUN touch /run/openrc/softlevel

EXPOSE 21