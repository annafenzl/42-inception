FROM debian:buster

RUN apt-get update

RUN apt-get install -y nginx
RUN apt-get install -y openssl

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/default.conf /etc/nginx/conf.d/default.conf

# setup ssl
COPY ./tools/entrypoint.sh /var/www/
RUN chmod +x /var/www/entrypoint.sh

ENTRYPOINT [ "var/www/entrypoint.sh" ]

CMD ["nginx", "-g", "daemon off;"]

