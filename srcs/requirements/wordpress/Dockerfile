FROM debian:bullseye

RUN	apt-get update

RUN apt install curl -y

RUN	apt install php -y

RUN apt install php-fpm -y

RUN	apt install php-mysql -y

RUN apt install mariadb-client -y

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN mkdir /home/script

COPY script.sh /home/script

RUN	chmod 777 /home/script/script.sh

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html

CMD [ "/home/script/script.sh" ]