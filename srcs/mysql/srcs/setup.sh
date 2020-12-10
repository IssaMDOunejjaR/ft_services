#! /bin/sh

service mariadb start

mysql < /tmp/create_tables.sql
mysql -u root -e "CREATE USER 'issam'@'%' IDENTIFIED BY '123456';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'issam'@'%';"
mysql -u root -e "CREATE USER 'ounejjar'@'%' IDENTIFIED BY '123456';"
mysql -u root -e "GRANT SELECT, INSERT, UPDATE, DELETE ON phpmyadmin.* TO 'ounejjar'@'%';"
mysql -u root -e "CREATE DATABASE wordpress_db;"
mysql -u root -e "GRANT ALL ON wordpress_db.* TO 'issam'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"
mysql -u root -D wordpress_db < /tmp/wordpress_db.sql

service mariadb restart