FROM alpine

RUN apk update && apk upgrade
RUN apk add vim
RUN apk add openrc --no-cache
RUN apk add nginx
RUN apk add openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MA/ST=Khouribga/L=Khouribga/O=1337/CN=issamounejjar"
RUN openrc
RUN touch /run/openrc/softlevel
COPY srcs/nginx.conf /etc/nginx/

EXPOSE 443 80 22

# RUN adduser -D -g 'www' www
# RUN mkdir /www
# RUN chown -R root:www /var/lib/nginx
# RUN chown -R root:www /www
# COPY services.sh .
# CMD sh ./services.sh && tail -f /dev/null