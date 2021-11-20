#!/bin/bash
sudo apt-get update
git clone https://github.com/bitcoin-core/secp256k1
sudo apt-get -y install make  
sudo apt-get -y install cmake  
sudo apt-get -y install automake
sudo apt-get -y install libtool
sudo apt-get -y install python3-pip
sudo apt-get -y install libleveldb-dev
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.6 2
cd secp256k1
./autogen.sh
./configure
make
make install 
cd ..
git clone https://github.com/mr-pandabear/panda-coin.git
cd panda-coin
pip3 install conan
mkdir build
mkdir data
cd build
conan install .. --build=libcurl
cd ..
cmake .
make all
nohup ./bin/server &