#!/bin/bash

# Configure PHP-FPM pour écouter sur le port 9000 au lieu d'un socket
sed -i "s|listen = /run/php/php7.3-fpm.sock|listen = 9000|g" /etc/php/7.3/fpm/pool.d/www.conf

# Vérifie si WordPress est déjà installé
if [ ! -f ./wp-config.php ]; then
    # Télécharge WordPress
    wp core download --allow-root --path=/var/www/wordpress/

    # Crée le fichier de configuration de WordPress
    wp config create --allow-root --dbname=$SQL_DATABASE --dbuser=$ADMIN_USER --dbpass=$WP_ADMIN_PWD \
        --dbhost=$SQL_HOST --path='/var/www/wordpress'

    # Installe WordPress
    wp core install --allow-root --title=$SITE_TITLE --url=$SITE_URL \
        --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_MAIL

    # Crée un nouvel utilisateur
    wp user create --allow-root $USER1_LOGIN $USER1_EMAIL --user_pass=$USER1_PASSWORD

else
    echo "Wordpress is already installed and configured"
fi

# Démarrage du service PHP-FPM
php-fpm7.3 --nodaemonize
