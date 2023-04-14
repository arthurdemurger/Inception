FROM debian:buster

# Installation
RUN	apt-get update
RUN	apt-get install -y  mariadb-server \
						mariadb_client

EXPOSE 3306

RUN	mkdir -p /var/run/mysqld

COPY	./tools.sql
COPY	./tools/install_mdb.sh /tmp/
COPY 	./conf/my_mariadb.cnf /etc/mysql

ENTRYPOINT	["sh", "/tmp/install_mdb.sh"]
