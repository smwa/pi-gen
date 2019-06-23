#!/bin/bash -e

cp -r files/sanctuary "${ROOTFS_DIR}/root/"

on_chroot <<EOF
pip install --upgrade pip
pip install -r "${ROOTFS_DIR}/root/sanctuary/requirements.txt"
EOF
