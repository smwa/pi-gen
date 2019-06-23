#!/bin/bash -e

on_chroot <<EOF
sed -i '/exit 0/d' "${ROOTFS_DIR}/etc/rc.local"
echo '( ( python "${ROOTFS_DIR}/root/sanctuary/manage.py" runserver 0.0.0.0:80 > /dev/null 2>&1 ); reboot ) &" >> "${ROOTFS_DIR}/etc/rc.local"
echo "exit 0" >> "${ROOTFS_DIR}/etc/rc.local"
EOF
