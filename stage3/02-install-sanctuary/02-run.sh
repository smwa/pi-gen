#!/bin/bash -e

on_chroot <<EOF
sed -i '/exit 0/d' "/etc/rc.local"
echo "python3 /root/sanctuary/manage.py migrate" >> "/etc/rc.local"
echo "( ( python3 /root/sanctuary/manage.py runserver 0.0.0.0:80 --insecure > /dev/null 2>&1 ); reboot ) &" >> "/etc/rc.local"
echo "exit 0" >> "/etc/rc.local"
EOF
