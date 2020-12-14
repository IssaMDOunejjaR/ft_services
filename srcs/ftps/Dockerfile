FROM alpine

RUN apk update && apk upgrade
RUN apk add openrc vsftpd supervisor openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt -subj "/C=MA/ST=Khouribga/L=Khouribga/O=1337/CN=issamounejjar"

RUN apk add telegraf --update --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted

RUN adduser -D user
RUN echo "user:password" | chpasswd

COPY /srcs/supervisord.conf /etc/
COPY /srcs/vsftpd.conf /etc/vsftpd/
COPY /srcs/telegraf.conf /etc/

RUN openrc
RUN touch /run/openrc/softlevel

CMD /usr/bin/supervisord -c /etc/supervisord.conf

EXPOSE 21 30000