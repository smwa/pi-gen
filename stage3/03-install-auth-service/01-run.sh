#!/bin/bash -e

mkdir -p "${ROOTFS_DIR}/var/www/"
cp -r files/auth-service "${ROOTFS_DIR}/var/www/"

on_chroot <<EOF
python3 -m pip install --upgrade pip
python3 -m pip install -r "/var/www/auth-service/requirements.txt"
EOF
