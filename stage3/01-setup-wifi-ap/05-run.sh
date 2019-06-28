#!/bin/bash -e

on_chroot <<EOF
sed -i '/exit 0/d' "/etc/rc.local"
echo 'systemctl unmask hostapd' >> "/etc/rc.local"
echo 'systemctl enable hostapd' >> "/etc/rc.local"
echo 'systemctl start hostapd' >> "/etc/rc.local"
echo "exit 0" >> "/etc/rc.local"
EOF
