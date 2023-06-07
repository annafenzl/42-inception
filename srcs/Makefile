# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: afenzl <afenzl@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/07 14:03:11 by afenzl            #+#    #+#              #
#    Updated: 2023/06/07 14:03:11 by afenzl           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = inception

SRC_DIR = ./srcs
ENV_FILE = $(SRC_DIR)/.env
COMPOSE_FILE = $(SRC_DIR)/docker-compose.yml
IMAGE_DIR = $(SRC_DIR)/requirements

VOLUMES_DIR = /home/user42/volumes
DB_VOLUME = $(VOLUMES_DIR)/mariadb_v
WP_VOLUME = $(VOLUMES_DIR)/wordpress_v

COMPOSE = sudo docker compose --env-file=$(ENV_FILE) -f $(COMPOSE_FILE)

all: $(NAME)

$(NAME): create_volumes
	$(COMPOSE) up --build -d

stop:
	$(COMPOSE) stop

clean:
	$(COMPOSE) down --volumes --rmi all

fclean: clean delete_volumes

create_volumes:
	sudo mkdir -p $(DB_VOLUME) $(WP_VOLUME)
	sudo chmod 777 $(DB_VOLUME) $(WP_VOLUME)

delete_volumes:
	sudo rm -rf $(DB_VOLUME) $(WP_VOLUME)

re: fclean $(NAME)

.PHONY: all $(NAME) stop clean fclean create_volumes delete_volumes re