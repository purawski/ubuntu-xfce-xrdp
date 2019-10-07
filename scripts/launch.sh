#!/bin/bash

#/etc/NX/nxserver --startup
#tail -f /usr/NX/var/log/nxserver.log
mkdir -p /var/run/sshd
mkdir -p /var/run/xrdp
/etc/init.d/xrdp start
exec /usr/sbin/sshd -D
sleep infinity