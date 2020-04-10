#!/bin/bash
while true
do

#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"

clear
echo "\33[1;32m   ************************************************************************"
echo "   *      ${CIAN}      Script para Grabar pantallas Nextion \33[1;33mV.02.07.07           \33[1;32m*"
echo "   *                                \33[1;31mby EA3EIZ\33[1;32m                             *"
echo "   ************************************************************************"
echo ""
echo "${CIAN}   1)${AMARILLO} Grabar pantalla Nextion 2.4 ADER (Compatible Nextion Driver)"
echo ""
echo "${CIAN}   2)${GRIS} Grabar pantalla Nextion 2.4 MMDVM ON7LDS original"
echo "${CIAN}   3)${GRIS} Grabar pantalla Nextion 2.8 MMDVM ON7LDS original"
echo "${CIAN}   4)${GRIS} Grabar pantalla Nextion 3.2 MMDVM ON7LDS original"
echo "${CIAN}   5)${GRIS} Grabar pantalla Nextion 4.3 MMDVM ON7LDS original"
echo ""

echo ""
echo "${CIAN}   0)${ROJO} Salir "
echo ""
echo -n "${CIAN}   Elige una opción: " 
read escoger_menu
echo ""
case $escoger_menu in

1) echo ""
while true
do
clear
	                    ejecutar1=S
		                case $ejecutar1 in
			            [sS]* ) echo ""
			            echo ">>>>>>>>> NextionDriver ADER_07.tft >>>>>>>>"
			            #pasa el fichero nextion.py del Ingles G4KLX al ON7LDS
			            sudo cp -f /home/pi/MMDVMHost/Nextion_G4KLX/nextion.py /home/pi/MMDVMHost/Nextion_ON7LDS
			            cd /home/pi/MMDVMHost/Nextion_ON7LDS
			            sudo rm ADER_07.tft
			            wget http://associacioader.com/ADER_07.tft
                        sudo python nextion.py ADER_07.tft /dev/ttyUSB0
                        sleep 10
		                break;;
		                [nN]* ) echo ""
						clear
						exit;
						break;;
esac
done;;
2) echo ""
while true
do
clear
	                    ejecutar1=S
		                case $ejecutar1 in
			            [sS]* ) echo ""
			            echo ">>>>>>>>> GRABAR NEXTION ORIGINAL 2.4 pulgadas >>>>>>>>"
			            #pasa el fichero nextion.py del Ingles G4KLX al Aleman DB20E
			            sudo cp -f /home/pi/MMDVMHost/Nextion_G4KLX/nextion.py /home/pi/MMDVMHost/Nextion_ON7LDS
                        cd /home/pi/MMDVMHost/Nextion_ON7LDS
                        sudo python nextion.py NX3224T024-L3.tft /dev/ttyUSB0
                        sleep 10
		                break;;
		                [nN]* ) echo ""
						clear
						#
						exit;
						break;;
esac
done;;
3) echo ""
while true
do
clear
	                    ejecutar1=S
		                case $ejecutar1 in
			            [sS]* ) echo ""
			            echo ">>>>>>>>> GRABAR NEXTION ORIGINAL 2.8 pulgadas >>>>>>>>"
			            #pasa el fichero nextion.py del Ingles G4KLX al Aleman DB20E
			            sudo cp -f /home/pi/MMDVMHost/Nextion_G4KLX/nextion.py /home/pi/MMDVMHost/Nextion_ON7LDS
                        cd /home/pi/MMDVMHost/Nextion_ON7LDS
                        sudo python nextion.py NX3224T028-L3.tft /dev/ttyUSB0
                        sleep 10
		                break;;
		                [nN]* ) echo ""
						clear
						exit;
						break;;
esac
done;;
4) echo ""
while true
do
clear
	                    ejecutar1=S
		                case $ejecutar1 in
			            [sS]* ) echo ""
			            echo ">>>>>>>>> GRABAR NEXTION ORIGINAL 3.2 pulgadas >>>>>>>>"
			            #pasa el fichero nextion.py del Ingles G4KLX al Aleman DB20E
			            sudo cp -f /home/pi/MMDVMHost/Nextion_G4KLX/nextion.py /home/pi/MMDVMHost/Nextion_ON7LDS
                        cd /home/pi/MMDVMHost/Nextion_ON7LDS
                        sudo python nextion.py NX3224T032-L3.tft /dev/ttyUSB0
                        sleep 10
		                break;;
		                [nN]* ) echo ""
						clear
						exit;
						break;;
esac
done;;
5) echo ""
while true
do
clear
	                    ejecutar1=S
		                case $ejecutar1 in
			            [sS]* ) echo ""
			            echo ">>>>>>>>> GRABAR NEXTION ORIGINAL 4.3 pulgadas >>>>>>>>"
			            #pasa el fichero nextion.py del Ingles G4KLX al Aleman DB20E
			            sudo cp -f /home/pi/MMDVMHost/Nextion_G4KLX/nextion.py /home/pi/MMDVMHost/Nextion_ON7LDS
                        cd /home/pi/MMDVMHost/Nextion_ON7LDS
                        sudo python nextion.py NX3224T043-L3.tft /dev/ttyUSB0
                        sleep 10
		                break;;
		                [nN]* ) echo ""
						clear
						exit;
						break;;
esac
done;;
6) echo ""
while true
do
clear
	                    ejecutar1=S
		                case $ejecutar1 in
			            [sS]* ) echo ""
			            echo ">>>>>>>>> NextionDriver ADER_07.tft >>>>>>>>"
			            #pasa el fichero nextion.py del Ingles G4KLX al ON7LDS
			            sudo cp -f /home/pi/MMDVMHost/Nextion_G4KLX/nextion.py /home/pi/MMDVMHost/Nextion_ON7LDS
			            cd /home/pi/MMDVMHost/Nextion_ON7LDS
			            sudo rm NX3224T024_2.4_Time_REM.tft
			            wget http://associacioader.com/NX3224T024_2.4_Time_REM.tft
                        sudo python nextion.py NX3224T024_2.4_Time_REM.tft /dev/ttyUSB0
                        sleep 10
		                break;;
		                [nN]* ) echo ""
						clear
						exit;
						break;;
esac
done;;
0) echo ""
clear
echo "\33[1;33m   ******************************"
echo "   *                            *"
echo "   *     CERRANDO SCRIPT        *"
echo "   *                            *"
echo "   ******************************"
sleep 1
clear
exit;;	
esac
done

