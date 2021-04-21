mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
rc-service mariadb start


#mv database.sql .
mariadb -u root -e "CREATE USER  'pma'@'localhost' IDENTIFIED BY 'pmapass';"
mariadb -u root -e "GRANT ALL ON *.* to 'pma'@'%' IDENTIFIED BY 'pmapass' WITH GRANT OPTION;"
mariadb -u root -e "FLUSH PRIVILEGES;"
mariadb -u root < create_tables.sql