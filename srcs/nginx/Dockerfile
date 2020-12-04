FROM alpine

RUN apk update && apk upgrade
RUN apk add openrc nginx openssh openssl supervisor
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MA/ST=Khouribga/L=Khouribga/O=1337/CN=issamounejjar"

COPY /srcs/nginx.conf /etc/nginx/
COPY /srcs/index.html /www/
COPY /srcs/supervisord.conf /etc/

RUN openrc
RUN touch /run/openrc/softlevel

RUN mkdir -p /run/nginx
RUN adduser -D user
RUN echo "user:password" | chpasswd
RUN ssh-keygen -A

# CMD /usr/bin/supervisord -c /etc/supervisord.conf && tail -f /dev/null

EXPOSE 443 80 22