FROM alpine

RUN apk update && apk upgrade
RUN apk add openrc nginx supervisor
RUN apk add php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN apk add php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype

RUN apk add telegraf --update --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

COPY srcs/nginx.conf /etc/nginx/
COPY /srcs/index.html /www/
COPY /srcs/supervisord.conf /etc/
RUN mkdir -p /run/nginx

RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz
RUN rm latest.tar.gz
RUN mv wordpress /www/

COPY /srcs/wp-config-sample.php /www/wordpress
RUN mv /www/wordpress/wp-config-sample.php /www/wordpress/wp-config.php

RUN openrc
RUN touch /run/openrc/softlevel

CMD /usr/bin/supervisord -c /etc/supervisord.conf

EXPOSE 5050 