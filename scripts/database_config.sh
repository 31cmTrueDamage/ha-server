#!/bin/bash

# Cacti user credentials
CACTI_USER="cacti"
CACTI_PASS="cacti"
CACTI_DB="cacti"

# Ganglia user credentials
GANGLIA_USER="ganglia"
GANGLIA_PASS="ganglia"
GANGLIA_DB="ganglia"

# Grant privileges for Cacti user
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON ${CACTI_DB}.* TO '${CACTI_USER}'@'192.168.30.121' IDENTIFIED BY '${CACTI_PASS}';"
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON ${CACTI_DB}.* TO '${CACTI_USER}'@'192.168.30.122' IDENTIFIED BY '${CACTI_PASS}';"

# Grant privileges for Ganglia user
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON ${GANGLIA_DB}.* TO '${GANGLIA_USER}'@'192.168.30.121' IDENTIFIED BY '${GANGLIA_PASS}';"
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON ${GANGLIA_DB}.* TO '${GANGLIA_USER}'@'192.168.30.122' IDENTIFIED BY '${GANGLIA_PASS}';"

sudo mysql -u root -e "GRANT SELECT ON mysql.time_zone_name TO 'cacti'@'192.168.30.121'; FLUSH PRIVILEGES;"
sudo mysql -u root -e "GRANT SELECT ON mysql.time_zone_name TO 'cacti'@'192.168.30.122'; FLUSH PRIVILEGES;"

# Flush privileges
sudo mysql -u root -e "FLUSH PRIVILEGES;"

echo "Cacti and Ganglia credentials have been updated and privileges granted."

sudo mysqladmin --user=root create cacti
sudo mysql -u root cacti < /vagrant/cacti.sql

# Import the timezone data into the mysql database
mysql_tzinfo_to_sql /usr/share/zoneinfo | sudo mysql -u root mysql