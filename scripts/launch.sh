#!/bin/bash

#/etc/NX/nxserver --startup
#tail -f /usr/NX/var/log/nxserver.log
mkdir -p /var/run/sshd
exec /usr/sbin/sshd -D
