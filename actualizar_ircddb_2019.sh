#!/bin/bash
						clear

						#Colores
						ROJO="\033[1;31m"
						VERDE="\033[1;32m"
						BLANCO="\033[1;37m"
						AMARILLO="\033[1;33m"
						CIAN="\033[1;36m"
						GRIS="\033[0m"
						MARRON="\33[38;5;138m"

						echo "${ROJO}"
						echo "            *******************************************************"
						echo "${BLANCO}"
						echo "                TODA LA CONFIGURACIÓN DEL ANTERIOR IRCDDBGATEWAY "
						echo ""
						echo "                  SE PERDERÁ Y DEBERÁS CONFIGURARLO DE NUEVO  "
						echo "${ROJO}"
						echo "            *******************************************************"
						echo "\v\v"
						echo "${CIAN}"

						echo -n "          Quieres actualizar Ircddbgateway a la última versión ? ${AMARILLO}S/N: "
						read actualizar						           	                           
                      	case $actualizar in
			          	[sS]* ) echo ""
						
						sudo mv /usr/local/bin/ircddbgateway /usr/local/bin/ircddbgateway_2016
						sudo mv /usr/local/bin/ircddbgatewayconfig /usr/local/bin/ircddbgatewayconfig_2016
						sudo mv /usr/local/bin/remotecontrol /usr/local/bin/remotecontrol_2016

						sudo cp /home/pi/V105/ircddbgateway /usr/bin/ircddbgateway
						sudo cp /home/pi/V105/ircddbgatewayconfig /usr/bin/ircddbgatewayconfig
						sudo cp /home/pi/V105/remotecontrol /usr/bin/remotecontrol

						sudo rm -R /usr/share/opendv
						sudo mkdir /usr/share/opendv
						sudo cp /usr/local/share/opendv/*.ambe /usr/share/opendv/
						sudo cp /usr/share/ircddbgateway/*.* /usr/share/opendv/

						sudo rm -R /var/log/opendv
						sudo mkdir /var/log/opendv

						sudo sed -i "20c 2019" /home/pi/.local/versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini
						clear
						echo "${VERDE}"
						echo "            *******************************************************"
						echo "${AMARILLO}"
						echo "                               PROCESO TERMINADO "
						echo ""
						echo "                    SE HA ACTUALIZADO A LA VERSIÓN:${CIAN} 20190402 "
						echo "${VERDE}"
						echo "            *******************************************************"
						sleep 2
						break;;
			       		[nN]* ) echo ""
						exit
			       		break;;
						esac



