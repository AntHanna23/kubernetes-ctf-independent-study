FROM ubuntu:18.04

RUN apt update && apt upgrade -y \
    && apt install -y openssh-server 


RUN useradd -ms /bin/bash admin \
    && echo 'admin:flyeaglesfly' | chpasswd

ENTRYPOINT service ssh restart && bash


COPY flag.txt /home/admin/flag.txt


