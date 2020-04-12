#!/bin/bash

cd /home/pi
sudo cp -R Desktop /home/pi/.local
sleep 1
sudo rm -R Desktop
sudo cp -R /home/pi/.local/Desktop /home/pi
sudo chmod 777 -R /home/pi/Desktop






                                