FROM ubuntu:18.04

RUN apt-get update \
    && apt-get install sudo \
    && apt-get install -y --no-install-recommends vsftpd 

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




#RUN /etc/init.d/vsftpd start
#RUN chmod +x home/admin/start.sh
# USER admin
# WORKDIR /etc/init.d/
# ENTRYPOINT [ "vsftpd" ]
# CMD [ "start" ]
