# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: annafenzl <annafenzl@student.42.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/22 14:20:48 by annafenzl         #+#    #+#              #
#    Updated: 2023/05/08 14:28:57 by annafenzl        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# The Dockerfiles must be called in your docker-compose.yml by your Makefile.
NAME = inception

SRC_DIR = ./srcs
ENV_FILE = $(SRC_DIR)/.env
COMPOSE_FILE = $(SRC_DIR)/docker-compose.yml
IMAGE_DIR = $(SRC_DIR)/requirements

# VOLUMES_DIR = /home/user42/data
# DB_VOLUME = $(VOLUMES_DIR)/mariadb_v
# WP_VOLUME = $(VOLUMES_DIR)/wordpress_v

COMPOSE = docker compose --env-file=$(ENV_FILE) -f $(COMPOSE_FILE)


all: $(NAME)

$(NAME): #create_volumes
	$(COMPOSE) up --build -d

stop:
	$(COMPOSE) stop

# create_volumes:
# 	sudo mkdir -p $(DB_VOLUME) $(WP_VOLUME)
# 	sudo chmod 777 $(DB_VOLUME) $(WP_VOLUME)

# delete_volumes:
# 	sudo rm -rf $(DB_VOLUME) $(WP_VOLUME)

clean:
	$(COMPOSE) down --volumes --rmi all

fclean: clean #delete_volumes

re: fclean $(NAME)

.PHONY: stop clean fclean re