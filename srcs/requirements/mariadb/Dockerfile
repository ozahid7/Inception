FROM debian:bullseye

RUN apt-get update

RUN	apt install mariadb-server -y

RUN mkdir -p /home/script

COPY tools/script.sh /home/script

RUN	chmod 777 /home/script/script.sh

CMD ["/home/script/script.sh"]
