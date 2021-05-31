
mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
rc-service mariadb start



#mv database.sql .
mysql -u root -e "CREATE USER  'pma'@'localhost' IDENTIFIED BY 'sbensarg123';"
mysql -u root -e "GRANT ALL ON *.* to 'pma'@'%' IDENTIFIED BY 'sbensarg123' WITH GRANT OPTION;"
mysql -u root -e "CREATE DATABASE phpmyadmin"
mysql -u root phpmyadmin < create_tables.sql
mysql -u root -e "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
mysql -u root -e "GRANT ALL ON wordpress.* TO 'sara'@'%' IDENTIFIED BY 'azerty';"
mysql -u root wordpress < wordpress.sql
mysql -u root -e "FLUSH PRIVILEGES;"

telegraf /etc/telegraf/telegraf.conf &

