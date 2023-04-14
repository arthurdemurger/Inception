FROM	debian:buster

# Installation
RUN		apt-get -y update
RUN		apt-get -y install nginx \
							openssl

# SSL
RUN		mkdir /etc/nginx/ssl
RUN		openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
		-keyout /etc/nginx/ssl/ademurge.key \
		-out /etc/nginx/ssl/ademurge.pem \
		-subj "/C=BE/ST=Brussels/L=Brussels/O=42network/OU=19campus/CN=ademurge/"

# Copy my nginx.conf
COPY	./conf/nginx.conf /etc/nginx/conf.d

# Run repository
RUN		mkdir -p /run/nginx

WORKDIR	/var/www/html

EXPOSE	443

CMD		["nginx", "-g", "daemon off;"]
