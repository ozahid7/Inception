FROM debian:bullseye

RUN	apt-get update

RUN apt-get install nginx -y

RUN apt-get install openssl -y

RUN mkdir /etc/nginx/sslcertificate

# RUN openssl genpkey -algorithm RSA -out /etc/nginx/sslcertificate/private.key

# RUN openssl req -new -key /etc/nginx/sslcertificate/private.key -out /etc/nginx/sslcertificate/certificate.csr

COPY nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]

