#!/bin/bash -e

on_chroot <<EOF
sed -i '/exit 0/d' "/etc/rc.local"
echo "( cd /var/www/auth-service ; uwsgi -s /tmp/authWsgi.sock --manage-script-name --mount /=authService:app > /dev/null 2>&1 ) &" >> "/etc/rc.local"
echo "exit 0" >> "/etc/rc.local"
EOF
