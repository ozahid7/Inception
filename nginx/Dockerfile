FROM debian:buster

RUN	apt update

RUN apt install nginx

RUN mkdir -p /var/www/html

RUN touch /var/www/html/index.html

COPY nginx.conf /etc/nginx/nginx.conf


CMD [ "sleep" "100000000"]


