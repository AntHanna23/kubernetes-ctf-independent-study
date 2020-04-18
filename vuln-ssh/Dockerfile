FROM ubuntu:18.04

RUN apt update && apt upgrade -y \
    && apt install -y openssh-server 

RUN useradd -G sudo,root -ms /bin/bash admin \
    && echo 'admin:flyeaglesfly' | chpasswd 
#     && echo "admin ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/admin && \
#     chmod 0440 /etc/sudoers.d/admin

RUN mkdir -p /var/ftp/flag \
    && chown nobody:nogroup /var/ftp/flag

ENTRYPOINT service ssh start && bash

COPY flag.txt /home/admin/flag.txt


