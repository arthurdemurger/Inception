# Check if the specified database already exists
if [ -d /var/lib/mysql/$SQL_DATABASE ]; then
	echo "DB $SQL_DATABASE already exists..."
else
	# Start the MySQL service with the specified data directory
	service mysql start --datadir=/var/lib/mysql

	# Create the database and root user using the provided SQL script
	echo "create database if not exists $SQL_DATABASE;"| mysql -u root
	echo "create user '$SQL_ADMIN'@'%' identified by '$SQL_PWD';" | mysql -u root
	echo "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_ADMIN'@'%';" | mysql -u root
	echo "FLUSH PRIVILEGES;" | mariadb -u root

	# Set a password for the root user
	mysqladmin -u root password $SQL_PWD

	# Stop the MySQL service
	service mysql stop --datadir=/var/lib/mysql
fi

# Start the MySQL service in safe mode with the specified data directory
mysqld_safe --datadir=/var/lib/mysql
