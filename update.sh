#!/bin/bash
sudo service pandacoin stop
cd /home/ubuntu/panda-coin
git pull
rm genesis.json
sudo rm -rf data
mkdir data
sudo cmake .
sudo make server
sudo service pandacoin start