#!/bin/bash -e
cp -r files/nginx.conf "${ROOTFS_DIR}/etc/nginx/nginx.conf"
mkdir -p "${ROOTFS_DIR}/var/www/"
cp -r files/captive-portal "${ROOTFS_DIR}/var/www/captive-portal"
