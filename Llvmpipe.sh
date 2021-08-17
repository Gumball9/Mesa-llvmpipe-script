#!/usr/bin/env bash

# * stage:1 uncomment sources repo and get build dependencies
sudo sed -i 's/# deb-src/deb-src/' /etc/apt/sources.list
sudo apt update
sudo apt build-dep mesa -y

# * stage 2 get dependencies
dependencies="llvm-12 libvulkan-dev -y python python3 python3-mako python3-pip build-essential meson bison flex"
sudo apt install "${dependencies}" -y

# * stage 3 Download and build mesa llvm
wget https://archive.mesa3d.org//mesa-21.2.0.tar.xz
tar -xf mesa-21.2.0.tar.xz

# building

cd mesa-21.2.0 || {
    echo "failed to do cd"
    exit 1
}
 mkdir build
 cd build || {
    echo "failed to do cd"
    exit 1
}

meson build ../
sudo ninja install

echo "Done"

glxinfo | grep Mesa