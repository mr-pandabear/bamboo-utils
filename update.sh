#!/bin/bash
sudo service pandacoin stop
cd /home/ubuntu
sudo rm -rf panda-coin
git clone https://github.com/mr-pandabear/panda-coin.git
cd panda-coin
mkdir build
mkdir data
cd build
sudo conan install .. --build=libcurl
cd ..
cmake .
make server
sudo service pandacoin start