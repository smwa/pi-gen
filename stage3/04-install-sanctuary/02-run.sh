#!/bin/bash -e

on_chroot <<EOF
sed -i '/exit 0/d' "/etc/rc.local"
echo "python3 /var/www/sanctuary/manage.py migrate" >> "/etc/rc.local"
echo "( cd /var/www/sanctuary ; uwsgi --socket /tmp/uwsgi.sock --module sanctuary.wsgi > /dev/null 2>&1 ) &" >> "/etc/rc.local"
echo "exit 0" >> "/etc/rc.local"
EOF
