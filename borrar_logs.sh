#!/bin/bash
sudo rm /home/pi/MMDVMHost/*.log
clear
#sudo rm /var/log/irc*.log
sudo rm /home/pi/YSFClients/YSFGateway/*.log
clear
sudo rm /home/pi/DMR2NXDN/*.log
clear
sudo rm /home/pi/DMR2YSF/*.log
clear
sudo rm /home/pi/NXDNClients/NXDNGateway/*.log

sudo rm /var/log/*.log
sudo rm /var/log/dvswitch/Analog*

sudo rm /var/log/mmdvm/MMDVM*
clear
echo "\33[1;32m<<<<< BORRANDO TODOS LOS LOGS >>>>>"
sleep 5