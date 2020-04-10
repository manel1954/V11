#!/bin/bash
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"


                        # 09-04-2020 copia YSFGateway.ini
                       
                        cp /home/pi/V105/YSFGateway.ini /home/pi/YSFClients/YSFGateway/
                        sudo sed -i "21c YSFGateway_OK" /home/pi/.local/versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini
                        echo "${VERDE}"
                        echo "************************************************************"
                        echo "                                                            "
                        echo "            ACABAS DE ACTUALIZAR TU YSFGATEWAY              "
                        echo " CONFIGURA DE NUEVO TUS DATOS DESDE EL BOTÓN EDITAR YSF/FCS "
                        echo "                                                            "
                        echo "************************************************************"
                        echo ""
                        echo "${ROJO}"
                        echo "************************************************************"
                        echo "                                                            "
                        echo "      ADVERTENCIA!! NO RESTAURES TU COPIA DE SEGURIDAD      "
                        echo "         YA QUE CONTIENE UN INI ANTIGUO E INVALIDO          "
                        echo "                                                            "
                        echo "************************************************************"
                        echo "${CIAN}"
                        echo "Pulsa enter para salir"
                        read a     


echo "${VERDE}"
clear
echo "*************************************"
echo "* ACTUALIZANDO LISTADO DE SALAS YSF *"
echo "* ***********************************"
sleep 3
                        cd /home/pi/YSFClients/YSFGateway
                        sudo wget -O YSFHosts.txt http://register.ysfreflector.de/export_csv.php
                        sleep 3
clear
echo "${AMARILLO}"                      
echo "**********************************************************"
echo "* El fichero YSFHost.txt se ha actualizado correctamente *"
echo "**********************************************************"
sleep 3
                        fi



                        cp -R /home/pi/YSF2DMR/ /home/pi/Documents                                     
                        clear
                        cd /home/pi/
                        sudo rm -R /home/pi/MMDVM_CM
                        sudo rm -R /home/pi/YSF2DMR
                        git clone http://github.com/juribeparada/MMDVM_CM
                        mkdir YSF2DMR
                        cp /home/pi/MMDVM_CM/YSF2DMR/* /home/pi/YSF2DMR/
                        cd /home/pi/YSF2DMR/                  

                        cp /home/pi/YSF2DMR/YSF2DMR.ini YSF2DMR.ini_copia_01
                        cp /home/pi/YSF2DMR/YSF2DMR.ini YSF2DMR.ini_copia_02
                        cp /home/pi/YSF2DMR/YSF2DMR.ini YSF2DMR.ini_copia_03
                        cp /home/pi/YSF2DMR/YSF2DMR.ini YSF2DMR.ini_copia_04

                        #comprueba si la versión a cambiado
                        version_YSF2DMR_actual=$(awk "NR==23" /home/pi/YSF2DMR/Version.h)
                        version_YSF2DMR_instalada=$(awk "NR==2" /home/pi/.local/versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini)
                        if [ "$version_YSF2DMR_actual" = "$version_YSF2DMR_instalada" ];
                        # =================================
                        then 
                        cp -R /home/pi/Documents/YSF2DMR/ /home/pi/
                        clear
                        echo "${VERDE}"
                        echo "***************************************"
                        echo "* YA TIENES LA ÚLTIMA VERSION YSF2DMR *"
                        echo "* $version_YSF2DMR_actual   *"
                        echo "***************************************"
                        sleep 4
                        else
                        sed -i "2c $version_YSF2DMR_actual" /home/pi/.local/versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini 
                        echo "${ROJO}"
                        echo "*******************************************"
                        echo "*         INSTALANDO YSF2DMR              *"
                        echo "*******************************************"
                        make clean
                        make
                        clear                      
                        sudo chmod +x -R /home/pi/Desktop 
                        sudo chmod 777 -R /home/pi/YSF2DMR

                        cp /home/pi/YSF2DMR/YSF2DMR.ini YSF2DMR.ini_copia_01
                        cp /home/pi/YSF2DMR/YSF2DMR.ini YSF2DMR.ini_copia_02
                        cp /home/pi/YSF2DMR/YSF2DMR.ini YSF2DMR.ini_copia_03
                        cp /home/pi/YSF2DMR/YSF2DMR.ini YSF2DMR.ini_copia_04
                        fi
                        cp -R /home/pi/DMR2YSF/ /home/pi/Documents
                        clear
                        cd /home/pi/
                        sudo rm -R /home/pi/MMDVM_CM
                        sudo rm -R /home/pi/DMR2YSF
                        git clone http://github.com/juribeparada/MMDVM_CM
                        mkdir DMR2YSF
                        cp /home/pi/MMDVM_CM/DMR2YSF/* /home/pi/DMR2YSF/
                        cd /home/pi/DMR2YSF/                  

                        #comprueba si la versión a cambiado
                        version_DMR2YSF_actual=$(awk "NR==23" /home/pi/DMR2YSF/Version.h)
                        version_DMR2YSF_instalada=$(awk "NR==3" /home/pi/.local/versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini)
                        if [ "$version_DMR2YSF_actual" = "$version_DMR2YSF_instalada" ];
                        # =================================
                        then
                        cp -R /home/pi/Documents/DMR2YSF/ /home/pi/ 
                        clear
                        echo "${BLANCO}"
                        echo "***************************************"
                        echo "* YA TIENES LA ÚLTIMA VERSION DMR2YSF *"
                        echo "* $version_DMR2YSF_actual   *"
                        echo "***************************************"
                        sleep 4
                        
                        else
                        sed -i "3c $version_DMR2YSF_actual" /home/pi/.local/versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini 
                        echo "${ROJO}"
                        echo "*******************************************"
                        echo "*         INSTALANDO DMR2YSF              *"
                        echo "*******************************************"
                        make clean
                        make
                        clear                      
                        sudo chmod +x -R /home/pi/Desktop 
                        sudo chmod 777 -R /home/pi/DMR2YSF                       
                        fi
                            





                        cp -R /home/pi/DMR2NXDN/ /home/pi/Documents
                        clear
                        cd /home/pi/
                        sudo rm -R /home/pi/MMDVM_CM
                        sudo rm -R /home/pi/DMR2NXDN
                        git clone http://github.com/juribeparada/MMDVM_CM
                        mkdir DMR2NXDN
                        cp /home/pi/MMDVM_CM/DMR2NXDN/* /home/pi/DMR2NXDN/
                        cd /home/pi/DMR2NXDN/                  

                        #comprueba si la versión a cambiado
                        version_DMR2NXDN_actual=$(awk "NR==23" /home/pi/DMR2NXDN/Version.h)
                        version_DMR2NXDN_instalada=$(awk "NR==4" /home/pi/.local/versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini)
                        if [ "$version_DMR2NXDN_actual" = "$version_DMR2NXDN_instalada" ];
                        # =================================
                        then
                        cp -R /home/pi/Documents/DMR2NXDN/ /home/pi/ 
                        clear
                        echo "${VERDE}"
                        echo "****************************************"
                        echo "* YA TIENES LA ÚLTIMA VERSION DMR2NXDN *"
                        echo "* $version_DMR2YSF_actual    *"
                        echo "****************************************"
                        sleep 4
                        
                        else
                        sed -i "4c $version_DMR2NXDN_actual" /home/pi/.local/versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini 
                        echo "${ROJO}"
                        echo "*******************************************"
                        echo "*         INSTALANDO DMR2NXDN              *"
                        echo "*******************************************"
                        make clean
                        make
                        clear                      
                        sudo chmod +x -R /home/pi/Desktop 
                        sudo chmod 777 -R /home/pi/DMR2NXDN                        
                        fi







                        
                        clear

                        #comprueba si la versión a cambiado
                        version_NXDNClients_actual=$(awk "NR==22" /home/pi/NXDNClients/NXDNGateway/Version.h)
                        version_NXDNClients_instalada=$(awk "NR==5" /home/pi/.local/versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini)
                        if [ "$version_NXDNClients_actual" = "$version_NXDNClients_instalada" ];
                        # =================================
                        # =================================
                        then 
                        clear
                        echo "${AMARILLO}"
                        echo "************************************************************"
                        echo "*   YA TIENES LA ÚLTIMA VERSIÓN NXDNClients                *"
                        echo "*   $version_NXDNClients_actual                      *"
                        echo "************************************************************"
                        sleep 4
                        clear
                        sudo rm -R /home/pi/MMDVM_CM
                        else
                        sed -i "5c $version_NXDNClients_actual" /home/pi/.local/versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini  
                        echo "${VERDE}DESCARGANDO E INSTALANDO EL ÚLTIMO NXDNClients${CIAN}"
                        sleep 4
                        sudo rm -R /home/pi/NXDNClients
                        cd /home/pi
                        git clone https://github.com/g4klx/NXDNClients
                        cd /home/pi/NXDNClients/NXDNGateway
                        make clean
                        make
                        sudo rm -R /home/pi/MMDVM_CM
                        fi                 
                        
