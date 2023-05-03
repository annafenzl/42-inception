# run with docker run -dp 443:443 my_nginx
FROM debian:buster

RUN apt update \
&& apt install nginx openssl -y

COPY ./configs/default /etc/nginx/sites-enabled/default
COPY ./tools/nginx_start.sh /var/www/

RUN chmod +x /var/www/nginx_start.sh

ENTRYPOINT [ "var/www/nginx_start.sh" ]

CMD ["nginx", "-g", "daemon off;"]
# docker run -dp 443:80 my_nginx (do i need -it/)
# docker exec -it <container name> /bin/bash

# RUN ["executable", "param1", "param2"] (if you use that read the rulse again)
# The default shell for the shell form can be changed using the SHELL command.

# CMD ["executable","param1","param2"] (exec form, this is the preferred form)
# CMD ["param1","param2"] (as default parameters to ENTRYPOINT)
# CMD command param1 param2 (shell form)