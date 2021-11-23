#!/bin/bash
sudo apt-get update
sudo apt-get -y install make  
sudo apt-get -y install cmake  
sudo apt-get -y install automake
sudo apt-get -y install libtool
sudo apt-get -y install python3-pip
sudo apt-get -y install libleveldb-dev
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.6 2
git clone https://github.com/mr-pandabear/panda-coin.git
cd panda-coin
sudo pip3 install conan
mkdir build
mkdir data
cd build
sudo conan install .. --build=libcurl
cd ..
cmake .
make all
sudo cp /home/ubuntu/panda-utils/pandacoin.service /etc/systemd/system/pandacoin.service
sudo systemctl daemon-reload
sudo service pandacoin start
