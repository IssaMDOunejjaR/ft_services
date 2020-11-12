FROM alpine

RUN apk update && apk upgrade
RUN apk add vim
RUN apk add openrc --no-cache
RUN apk add nginx
RUN apk add openssh
RUN apk add openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MA/ST=Khouribga/L=Khouribga/O=1337/CN=issamounejjar"
COPY srcs/nginx.conf /etc/nginx/
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
COPY /srcs/index.html /www/
RUN openrc
RUN touch /run/openrc/softlevel

EXPOSE 443 80 22

# COPY services.sh .
# CMD sh ./services.sh && tail -f /dev/null