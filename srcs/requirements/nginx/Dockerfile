FROM debian:buster

RUN apt-get update

RUN apt-get install -y nginx openssl

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/default.conf /etc/nginx/conf.d/default.conf

# by putting this in the Dockerfile i can omit to call the entrypoint script
RUN echo "setting up ssl"
RUN openssl req -x509 -nodes -days 356 -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj /C=DE/ST=Heilbronn/L=Heilbronn/O=wordpress/CN=$DOMAIN
RUN echo "ssl is set up!"

# setup ssl
# COPY ./tools/entrypoint.sh /var/www/
# RUN chmod +x /var/www/entrypoint.sh

# ENTRYPOINT [ "/var/www/entrypoint.sh" ]

CMD ["nginx", "-g", "daemon off;"]

