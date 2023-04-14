FROM debian:buster

# Installation
RUN		apt-get -y update
RUN		apt-get -y install curl \
							php7.3-fpm \
							php7.3-mysql

# Download wp cli
RUN		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
		chmod +x wp-cli.phar && \
		mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html

# Run repository
RUN		mkdir -p /run/php

