FROM debian:buster

# Update the package repository
RUN apt-get update -y
# Upgrade installed packages
RUN apt-get upgrade -y
# Install Nginx web server
RUN apt-get install nginx -y
# Install OpenSSL package for certificate generation
RUN apt-get install openssl -y

# Create directory for SSL certificates
RUN mkdir -p /etc/nginx/ssl

# Generate a self-signed SSL certificate
RUN openssl req -x509 -nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=BE/ST=Brussels/L=Brussels/O=42network/OU=19campus/CN=ademurge.42.fr/UID=ademurge"

# Nginx configuration
# Create directory for Nginx runtime files
RUN mkdir -p /var/run/nginx

# Copy custom Nginx configuration file
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Expose port 443 for HTTPS connections
EXPOSE 443

RUN mkdir -p /var/www/wordpress
# Set permissions for the web root directory
RUN chmod 755 /var/www/wordpress
# Change ownership of the web root directory to the www-data user
RUN chown -R www-data:www-data /var/www/wordpress

# Start Nginx in the foreground when the container is run
CMD ["nginx", "-g", "daemon off;"]
