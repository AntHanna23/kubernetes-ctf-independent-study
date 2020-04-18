#!/bin/bash
service vsftpd start
tail -f /dev/null
# set -e

# start-stop-daemon --start --background -m --oknodo --pidfile /var/run/vsftpd/vsftpd.pid --exec /usr/sbin/vsftpd

