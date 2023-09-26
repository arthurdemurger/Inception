# Using Debian Buster as base image
FROM debian:buster

# Update and install necessary utilities
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y curl php7.3 php-fpm php-mysql mariadb-client

# Set up directories and PHP environment
RUN mkdir -p /run/php/
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

# Set container working directory
WORKDIR /var/www/wordpress/

# Copy and set permissions for WordPress installer script
COPY ./tools/wp_installer.sh /usr/local/bin
RUN chmod +x /usr/local/bin/wp_installer.sh

# Set the entry point for the container
ENTRYPOINT ["sh", "/usr/local/bin/wp_installer.sh"]

# Expose PHP-FPM port
EXPOSE 9000
