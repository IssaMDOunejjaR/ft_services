FROM alpine

RUN apk update && apk upgrade
RUN apk add openrc nginx supervisor
RUN apk add lighttpd php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN apk add php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype php7-session php7-mbstring

RUN apk add telegraf --update --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

COPY srcs/nginx.conf /etc/nginx/
COPY /srcs/index.html /www/
COPY /srcs/supervisord.conf /etc/
RUN mkdir -p /run/nginx

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN tar zxvf phpMyAdmin-5.0.4-all-languages.tar.gz
RUN rm phpMyAdmin-5.0.4-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.4-all-languages phpmyadmin
RUN mv phpmyadmin /www

COPY /srcs/config.sample.inc.php /www/phpmyadmin
RUN mv /www/phpmyadmin/config.sample.inc.php /www/phpmyadmin/config.inc.php

RUN openrc
RUN touch /run/openrc/softlevel

CMD /usr/bin/supervisord -c /etc/supervisord.conf

EXPOSE 5000