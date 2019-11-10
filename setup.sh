#!/usr/bin/env bash

sudo apt-get install coreutils quilt parted qemu-user-static debootstrap zerofree zip dosfstools bsdtar libcap2-bin grep rsync xz-utils file git curl

cat << EOF > config
IMG_NAME=one
ENABLE_SSH=1
HOSTNAME=one
LOCALE_DEFAULT="en_US.UTF-8"
TIMEZONE_DEFAULT="Europe/Stockholm"
DEPLOY_DIR=/projects/deploy
EOF

touch ./stage3/SKIP ./stage4/SKIP ./stage5/SKIP
touch ./stage4/SKIP_IMAGES ./stage5/SKIP_IMAGES
sudo ./build.sh
