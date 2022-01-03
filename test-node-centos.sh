#!/bin/bash
sudo yum -y update
sudo yum -y install make  
sudo yum -y install cmake  
sudo yum -y install automake
sudo yum -y install libtool
sudo yum -y install python3-pip
sudo yum -y install libleveldb-dev
sudo yum -y install git
sudo yum -y install wget
sudo yum -y groupinstall 'Development Tools'
wget https://download-ib01.fedoraproject.org/pub/epel/8/Everything/x86_64/Packages/l/leveldb-1.22-1.el8.x86_64.rpm
sudo yum localinstall -y leveldb-1.22-1.el8.x86_64.rpm
wget https://download-ib01.fedoraproject.org/pub/epel/8/Everything/x86_64/Packages/l/leveldb-devel-1.22-1.el8.x86_64.rpm
sudo yum localinstall -y leveldb-devel-1.22-1.el8.x86_64.rpm
sudo mkdir /usr/lib/x86_64-linux-gnu
sudo cp /usr/lib64/libleveldb.so.1.22.0 /usr/lib/x86_64-linux-gnu/libleveldb.so
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.6 2
git clone https://github.com/mr-pandabear/panda-coin.git
cd panda-coin
sudo pip3 install conan
mkdir build
mkdir data
cd build
conan install .. 
cd ..
cmake .
make server
nohup ./bin/server &
