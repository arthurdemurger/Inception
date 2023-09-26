FROM debian:buster

RUN apt-get update && \
	apt-get install -y \
	mariadb-server

#Crée le dossier requis pour faire tourner mysqld
RUN mkdir -p /var/run/mysqld

#RUN mkdir -p '/var/run/mysqld/mysqld.sock'

#Copie le script dans les dossier du container
COPY tools/install_mariadb.sh install_mariadb.sh

#Remplace le fichier de configuration de mariadb par le notre.
COPY conf/mariadb.cnf /etc/mysql/

#Lance le script pour installer mariadb
ENTRYPOINT ["sh", "install_mariadb.sh"]
