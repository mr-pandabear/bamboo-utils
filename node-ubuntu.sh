#!/bin/bash
sudo apt-get update
sudo apt-get -y install make  
sudo apt-get -y install cmake  
sudo apt-get -y install automake
sudo apt-get -y install libtool
sudo apt-get -y install python3-pip
sudo apt-get -y install libleveldb-dev
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.6 2
git clone https://github.com/mr-pandabear/bamboo.git
cd bamboo
sudo pip3 install conan
mkdir build
mkdir data
cd build
sudo conan install .. 
cd ..
cmake .
make server
sudo sh -c 'curl https://raw.githubusercontent.com/mr-pandabear/bamboo-utils/master/bamboo.service > /etc/systemd/system/bamboo.service'
sudo service bamboo start
