#!/usr/bin/env bash

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install coreutils quilt parted qemu-user-static debootstrap zerofree zip dosfstools bsdtar libcap2-bin grep rsync xz-utils file git curl bc

NAME="one"

cat << EOF > config
IMG_NAME=$NAME
ENABLE_SSH=1
TARGET_HOSTNAME=$NAME
LOCALE_DEFAULT="en_US.UTF-8"
TIMEZONE_DEFAULT="Europe/Stockholm"
DEPLOY_DIR=/projects/deploy
EOF

touch ./stage3/SKIP ./stage4/SKIP ./stage5/SKIP
touch ./stage4/SKIP_IMAGES ./stage5/SKIP_IMAGES
sudo ./build.sh
