#!/bin/bash -e

mkdir -p "${ROOTFS_DIR}/var/www/"
git clone https://github.com/smwa/sanctuary.git "${ROOTFS_DIR}/var/www/sanctuary"

on_chroot <<EOF
python3 -m pip install --upgrade pip
python3 -m pip install -r "/var/www/sanctuary/requirements.txt"
EOF
