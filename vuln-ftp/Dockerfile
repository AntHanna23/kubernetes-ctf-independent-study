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

# Makes directory where anonymous users can access files
RUN mkdir -p /var/ftp 

# Copies the start.sh file into the container to start vsftpd
COPY start.sh /
# MAkes the vsftpd start.sh file executbale
RUN chmod +x /start.sh
#Copies flag to allow users to log into vsftpd and get flag via anonymous log in 
COPY ftp-flag.txt /var/ftp/flag/
# Copies the congig for vsftpd into the container to allow anonymous login but does not allow vrowser login
COPY vsftpd.conf /etc/

# Runs start script 
ENTRYPOINT ./start.sh

# Expose these ports when running docker containers 
EXPOSE 27 20 13450-13500
