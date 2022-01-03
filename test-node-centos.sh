#!/bin/bash
sudo yum -y update
sudo yum -y install make  
sudo yum -y install cmake  
sudo yum -y install automake
sudo yum -y install libtool
sudo yum -y install python3-pip
sudo yum -y install libleveldb-dev
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.6 2
git clone https://github.com/mr-pandabear/panda-coin.git
cd panda-coin
sudo pip3 install conan
mkdir build
mkdir data
cd build
sudo conan install .. 
cd ..
cmake .
make server
