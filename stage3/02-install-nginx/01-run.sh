#!/bin/bash -e
cp -r files/nginx.conf "${ROOTFS_DIR}/etc/nginx/nginx.conf"
cp -r files/selfsigned.crt "${ROOTFS_DIR}/etc/nginx/selfsigned.crt"
cp -r files/selfsigned.key "${ROOTFS_DIR}/etc/nginx/selfsigned.key"
mkdir -p "${ROOTFS_DIR}/var/www/"
cp -r files/captive-portal "${ROOTFS_DIR}/var/www/captive-portal"
