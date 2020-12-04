#! /bin/sh
service mariadb start

mysql < /www/phpmyadmin/sql/create_tables.sql
mysql -u root -e "CREATE USER 'issam'@'localhost' IDENTIFIED BY '123456';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'issam'@'localhost';"
mysql -u root -e "CREATE USER 'ounejjar'@'localhost' IDENTIFIED BY '123456';"
mysql -u root -e "GRANT SELECT, INSERT, UPDATE, DELETE ON phpmyadmin.* TO 'ounejjar'@'localhost';"
mysql -u root -e "CREATE DATABASE wordpress_db;"
mysql -u root -e "GRANT ALL ON wordpress_db.* TO 'issam'@'localhost';"
mysql -u root -D wordpress_db < wordpress.sql