#!/bin/bash -e

cp -r files/sanctuary "${ROOTFS_DIR}/root/"

on_chroot <<EOF
python3 -m pip install --upgrade pip
python3 -m pip install -r "/root/sanctuary/requirements.txt"
EOF
