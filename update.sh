#!/bin/bash
sudo service pandacoin stop
sudo service pandaminer stop
cd /home/ubuntu/panda-coin
git pull
sudo rm -rf data
mkdir data
sudo cmake .
sudo make server
sudo service pandacoin start
sudo service pandaminer start