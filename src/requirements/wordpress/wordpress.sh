#!bin/sh

# check if word press is already installed by checking if the config.php file is created
if [-f ./wp-config.php]
then
	echo "Wordpress is already installed."
else
	# download wordpress and add variables needed for the configuration of wordpress
	wp core download --path=/var/www/html --allow-root
	sed -i "s/database_name_here/$DB_NAME/g" wp-config-sample.php
	sed -i "s/username_here/$WP_ROOT_USER/g" wp-config-sample.php
	sed -i "s/password_here/$WP_ROOT_PWD/g" wp-config-sample.php
	sed -i "s/localhost/$DB_HOST/g" wp-config-sample.php
	mv wp-config-sample.php wp-config.php

 	# installation of wordpress
	wp core install --allow-root --title=$WP_TITLE \
								 --url=$WP_URL \
								 --admin_user=$WP_ROOT_NAME \
								 --admin_password=$WP_ROOT_PWD \
								 --admin_email=$WP_ROOT_MAIL

	# creation of an user
	wp user create --allowroot $WP_USER_NAME $WP_USER_MAIL --userpass=$WP_USER_PWD
fi

php-fpm7.3 --nodaemonize