# Use Debian Buster as the base image.
FROM debian:buster

# Update the OS and install utilities, PHP, and MariaDB client.
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y curl php7.3 php-fpm php-mysql mariadb-client

# Create necessary directories and set up WordPress CLI.
RUN mkdir -p /run/php/
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

# Define the working directory in the container.
WORKDIR /var/www/wordpress/

# Copy and make WordPress installer script executable.
COPY ./tools/wp_installer.sh /usr/local/bin
RUN chmod +x /usr/local/bin/wp_installer.sh

# Specify the container's startup command.
ENTRYPOINT ["sh", "/usr/local/bin/wp_installer.sh"]

# Open port 9000 for PHP-FPM.
EXPOSE 9000
