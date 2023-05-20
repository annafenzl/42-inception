# run with docker run -dp 443:443 my_nginx
FROM debian:buster

RUN apt update \
&& apt install nginx openssl -y

# copy configs
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/default.conf /etc/nginx/conf.d/default.conf

# setup ssl
COPY ./tools/nginx_start.sh /var/www/
RUN chmod +x /var/www/nginx_start.sh

ENTRYPOINT [ "var/www/nginx_start.sh" ]

CMD ["nginx", "-g", "daemon off;"]
