# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ademurge <ademurge@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/06 10:40:49 by ademurge          #+#    #+#              #
#    Updated: 2023/09/22 15:01:38 by ademurge         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	mkdir -p /home/ademurge/data/wordpress/
	mkdir -p /home/ademurge/data/mariadb/
	docker compose -f ./src/docker-compose.yml up -d --build

down:
	docker compose -f ./src/docker-compose.yml down

clean:
	docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\
	docker system prune --volumes -fa;

deep: clean
	sudo rm -rf ~/data

re: clean all

.PHONY: all re down clean deep