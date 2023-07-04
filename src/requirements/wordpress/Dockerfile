FROM debian:buster

# Installation
RUN apt-get -y update
RUN apt-get install -y wget
RUN apt-get install -y php7.3 php-fpm php-mysql mariadb-client

# Download WordPress
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
# Set ownership of WordPress files
RUN chown -R root:root /var/www/wordpress

# Expose port 9000 for PHP-FPM connections
EXPOSE 9000

# Copy PHP-FPM configuration
COPY ./conf/php.conf /etc/php/7.3/fpm/pool.d/www.conf

# Download WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Create directory for PHP runtime files
RUN mkdir -p /run/php

# Copy auto_config.sh script
COPY /conf/auto_config.sh auto_config.sh

# Start PHP-FPM service
RUN /usr/sbin/php-fpm7.3 -F

# Set auto_config.sh as the entrypoint script
ENTRYPOINT ["sh", "auto_config.sh"]
