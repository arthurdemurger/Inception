#
# shell script that installs and configures mariadb
#

# Start the MySQL service
service mysql start;
# Create the database if it doesn't exist
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
# Create the user if it doesn't exist, granting access from 'ademurge.42.fr' with the provided password
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'ademurge.42.fr' IDENTIFIED BY '${SQL_PASSWORD}';"
# Grant all privileges on the specified database to the user from any host ('%') with the provided password
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
# Change the root user's password, identified from 'ademurge.42.fr'
mysql -e "ALTER USER 'root'@'ademurge.42.fr' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
# Flush privileges to reload the grant tables and apply the changes
mysql -e "FLUSH PRIVILEGES;"
# Shutdown the MySQL service
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
# Start the MySQL service in safe mode
exec mysqld_safe