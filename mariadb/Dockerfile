FROM debian:buster

RUN apt-get update

RUN	apt install mariadb-server -y

RUN mkdir /home/script

COPY script.sh /home/script

RUN	chmod 777 /home/script/script.sh


CMD ["/home/script/script.sh"]