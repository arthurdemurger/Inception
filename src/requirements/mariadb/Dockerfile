FROM debian:buster

# Update the package repository and upgrade the system
RUN apt-get update -y
RUN apt-get upgrade -y

# Install MariaDB server
RUN apt-get install mariadb-server -y

# Expose port 3306 for MySQL connections
EXPOSE 3306

# Create a directory for the MySQL socket file
RUN mkdir -p /var/run/mysqld

# Copy the custom MySQL configuration file
COPY conf/my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the configuration script
COPY tools/config_mdb.sh /tmp/

# Set the entrypoint command for the container
ENTRYPOINT ["bash", "/tmp/install_mdb.sh"]
