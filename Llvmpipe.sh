sudo apt update && apt upgrade -y
sudo apt install wget -y

#Editing sources.list
sudo sed -i 's/# deb-src/deb-src/' /etc/apt/sources.list
sudo apt update && apt upgrade -y

#Installing Dependencies
sudo apt build-dep mesa -y
sudo apt build-dep llvm -y
sudo apt install llvm-12 -y
sudo apt install libvulkan-dev -y
sudo apt install python python3 python3-mako python3-pip -y
sudo apt install build-essential -y
sudo pip3 install meson bison flex -y

#Downloading mesa

https://archive.mesa3d.org//mesa-21.2.0.tar.xz
tar -xf mesa-21.2.0.tar.xz

#Building mesa

cd mesa-21.2.0
mkdir build && cd build
meson build
ninja
sudo ninja install
clear

echo "Done"



#checking mesa version

glxinfo | grep Mesa

