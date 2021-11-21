#!/bin/bash
sudo service pandacoin stop
cd ~
sudo rm -rf panda-coin
git clone https://github.com/mr-pandabear/panda-coin.git
cd panda-coin
mkdir build
mkdir data
cd build
conan install .. --build=libcurl
cd ..
cmake .
make all
sudo service pandacoin start