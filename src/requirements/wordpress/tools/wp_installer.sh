#!/bin/bash

sleep 5
# Configure PHP-FPM pour écouter sur le port 9000 au lieu d'un socket
sed -i "s|listen = /run/php/php7.3-fpm.sock|listen = 9000|g" /etc/php/7.3/fpm/pool.d/www.conf

# Vérifie si WordPress est déjà installé

ls -la

if [ ! -f ./wp-config.php ]; then
    # Télécharge WordPress
    wp core download --allow-root --path=/var/www/wordpress/

    # Crée le fichier de configuration de WordPress
    wp config create --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_ADMIN --dbpass=$SQL_PWD \
        --dbhost=$SQL_HOST --path='/var/www/wordpress'

    # Installe WordPress
    wp core install --allow-root --title=$WP_TITLE --url=$WP_URL \
        --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_MAIL

    # Crée un nouvel utilisateur
    wp user create --allow-root $WP_USER1 $WP_USER1_MAIL --user_pass=$WP_USER1_PWD

else
    echo "Wordpress is already installed and configured"
fi

# Démarrage du service PHP-FPM
php-fpm7.3 --nodaemonize
