FROM debian:bullseye

RUN	apt-get update

RUN apt-get install nginx -y

RUN apt-get install openssl -y

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048  -keyout /etc/ssl/private/key.key -out /etc/ssl/certs/cerif.crt -subj "/C=MA/ST=kh/L=khouribga/O=Global Security/OU=ma Department/CN=ozahid-.42.fr"

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]

