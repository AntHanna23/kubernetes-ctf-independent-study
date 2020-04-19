# Using Ubuntu 18.04 Image to build ftp container https://hub.docker.com/_/ubuntu
FROM ubuntu:18.04

# Updates the containerss repositiories, and installs ssh to the container
RUN apt update && apt upgrade -y \
    && apt install -y openssh-server 

RUN useradd -G sudo,root -ms /bin/bash admin \
    && echo 'admin:flyeaglesfly' | chpasswd 
#     && echo "admin ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/admin && \
#     chmod 0440 /etc/sudoers.d/admin

ENTRYPOINT service ssh start && bash

COPY flag.txt /home/admin/flag.txt


