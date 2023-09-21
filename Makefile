# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ademurge <ademurge@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/06 10:40:49 by ademurge          #+#    #+#              #
#    Updated: 2023/09/21 14:51:32 by ademurge         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	mkdir -p /home/ademurge/data/wordpress/
	mkdir -p /home/ademurge/data/mariadb/
	docker compose -f ./src/docker-compose.yml up -d --build

down:
	docker compose -f ./src/docker-compose.yml down

re:
	@docker compose -f ./src/docker-compose.yml up -d --build

clean:
	docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\
	docker system prune --volumes -fa;

deep: clean
	sudo rm -rf ~/data

.PHONY: all re down clean deep