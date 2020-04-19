# Using Ubuntu 18.04 Image to build ftp container https://hub.docker.com/_/ubuntu
FROM ubuntu:18.04

# Updates the conatiners repositiories, installs the sudo command, and downloads vsftpd without downloading Ubuntu's recommended dependencies
RUN apt-get update \
    && apt-get install sudo \
    && apt-get install -y --no-install-recommends vsftpd 

# This RUN command adds the admin user, password, and assigns sudoer permissions
RUN useradd -G sudo,root -ms /bin/bash admin \
     && echo 'admin:flyeaglesfly' | chpasswd \  
     && echo "admin ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/admin \
     && chmod 0440 /etc/sudoers.d/admin

RUN mkdir -p /var/ftp 

COPY start.sh /
RUN chmod +x /start.sh
COPY ftp-flag.txt /var/ftp/flag/
COPY vsftpd.conf /etc/


ENTRYPOINT ./start.sh


EXPOSE 27 20 13450-13500
# Example command for run 