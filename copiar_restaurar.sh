#!/bin/bash
clear
while true
do
clear
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
#Colores 
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"

echo "${VERDE}"
echo "  ****************************************************************************"
echo -n "${CIAN}"
echo "                   Script para Copiar y Restaurar Configuraciones       "
echo -n "${ROJO}"
echo "                                 $SCRIPTS_version by EA3EIZ"    
echo -n "${VERDE}"
echo "  ****************************************************************************"

echo "${CIAN}  1)${BLANCO} Hacer copias: BM, DMR+, RADIO, ESPECIAL, solo FUSION, solo DSTAR, YSF"
echo "     BlueDV, ircDDB, DSTAR Repeater, YSF2DMR, DMR2YSF, DMR2NXDN, NXDN, SVXLINK"
echo "     DVSWITCH, DMRGateway Y Editor GENERAL.  "
echo ""
echo "${CIAN}  2)${VERDE} Restaurar copias: BM, DMR+, ESPECIAL, RADIO, solo FUSION, solo DSTAR, YSF"
echo "     BlueDV, ircDDB, DSTAR Repeater, YSF2DMR, DMR2YSF, DMR2NXDN, NXDN, SVXLINK"
echo "     DVSWITCH, DNRGateway Y Editor GENERAL.  "
echo ""
echo "  ${ROJO}0) Salir "
echo ""
echo -n "\33[1;36m  Elige una opción " 
read escoger_menu
echo ""
case $escoger_menu in
1) echo ""
while true
do
clear
            echo "\33[1;36m" #color cian
            read -p 'QUIERES SEGUIR ADELANTE S/N ? ' sino
            case $sino in
            s|S) 
            clear
echo "${BLANCO}"
echo "\v\v\v"
echo " ******************************************************************************"
echo " ***********************  SE ESTÁ REALIZANDO LA COPIA  ************************"
echo " *********************  ${ROJO}AL ACABAR SE CERRARÁ EL TERMINAL  ${BLANCO}*********************"
echo " ******************************************************************************"
sleep 3
            sudo rm /home/pi/.local/COPIA_SEGURIDAD/Downloads/*.*
            
            cp /home/pi/.local/datos_dvswitch /home/pi/.local/COPIA_SEGURIDAD/Downloads
            cd /home/pi/MMDVMHost
            cp -f TODOS_LOS_INIS.ini /home/pi/.local/COPIA_SEGURIDAD/Downloads
            cp -f MMDVM.ini /home/pi/.local/COPIA_SEGURIDAD/Downloads
            cp -f MMDVM.ini_copia /home/pi/.local/COPIA_SEGURIDAD/Downloads
            cp -f MMDVM.ini_copia2 /home/pi/.local/COPIA_SEGURIDAD/Downloads
            cp -f MMDVM.ini_copia3 /home/pi/.local/COPIA_SEGURIDAD/Downloads
            cp -f MMDVM.ini_original /home/pi/.local/COPIA_SEGURIDAD/Downloads

            cp -f MMDVMBM.ini /home/pi/.local/COPIA_SEGURIDAD/Downloads
            cp -f MMDVMBM.ini_copia /home/pi/.local/COPIA_SEGURIDAD/Downloads
            cp -f MMDVMBM.ini_copia2 /home/pi/.local/COPIA_SEGURIDAD/Downloads
            cp -f MMDVMBM.ini_copia3 /home/pi/.local/COPIA_SEGURIDAD/Downloads

            cp -f MMDVMPLUS.ini /home/pi/.local/COPIA_SEGURIDAD/Downloads
            cp -f MMDVMPLUS.ini_copia /home/pi/.local/COPIA_SEGURIDAD/Downloads
            cp -f MMDVMPLUS.ini_copia2 /home/pi/.local/COPIA_SEGURIDAD/Downloads
            cp -f MMDVMPLUS.ini_copia3 /home/pi/.local/COPIA_SEGURIDAD/Downloads

            cp -f MMDVMESPECIAL.ini /home/pi/.local/COPIA_SEGURIDAD/Downloads
            cp -f MMDVMESPECIAL.ini_copia /home/pi/.local/COPIA_SEGURIDAD/Downloads
            cp -f MMDVMESPECIAL.ini_copia2 /home/pi/.local/COPIA_SEGURIDAD/Downloads
            cp -f MMDVMESPECIAL.ini_copia3 /home/pi/.local/COPIA_SEGURIDAD/Downloads

            cp -f MMDVMDMR2NXDN.ini /home/pi/.local/COPIA_SEGURIDAD/Downloads
            cp -f MMDVMDMR2YSF.ini /home/pi/.local/COPIA_SEGURIDAD/Downloads
            cp -f MMDVMNXDN.ini /home/pi/.local/COPIA_SEGURIDAD/Downloads

            cp -f /home/pi/DMR2NXDN/DMR2NXDN.ini  /home/pi/.local/COPIA_SEGURIDAD/Downloads
            cp -f /home/pi/NXDNClients/NXDNGateway/NXDNGateway.ini  /home/pi/.local/COPIA_SEGURIDAD/Downloads
            cp -f /home/pi/DMR2YSF/DMR2YSF.ini  /home/pi/.local/COPIA_SEGURIDAD/Downloads

            #solo Dstar y solo Fusion
            cp -f MMDVMDSTAR.ini /home/pi/.local/COPIA_SEGURIDAD/Downloads
            cp -f MMDVMFUSION.ini /home/pi/.local/COPIA_SEGURIDAD/Downloads
            #fin  Dstar y solo Fusion  

            #DMRGateway
            cd /home/pi/MMDVMHost
            cp -f DMRGateway.ini /home/pi/.local/COPIA_SEGURIDAD/Downloads
            cd /home/pi/DMRGateway
            cp -f DMRGateway.ini /home/pi/.local/COPIA_SEGURIDAD/Downloads/DMRGateway
            #Fin DMRGateway

            cd  /home/pi/YSF2DMR
            cp -f YSF2DMR.ini /home/pi/.local/COPIA_SEGURIDAD/Downloads
            cp -f YSF2DMR.ini_copia_01 /home/pi/.local/COPIA_SEGURIDAD/Downloads
            cp -f YSF2DMR.ini_copia_02 /home/pi/.local/COPIA_SEGURIDAD/Downloads
            cp -f YSF2DMR.ini_copia_03 /home/pi/.local/COPIA_SEGURIDAD/Downloads
            cp -f YSF2DMR.ini_copia_04 /home/pi/.local/COPIA_SEGURIDAD/Downloads

            cd  /home/pi/DMR2YSF
            cp -f TG-YSFList.txt /home/pi/.local/COPIA_SEGURIDAD/Downloads
            
            cd /home/pi/.local
            cp -f tg_ysf.txt /home/pi/.local/COPIA_SEGURIDAD/Downloads
            cp -f nombre_salas_ysf.txt /home/pi/.local/COPIA_SEGURIDAD/Downloads
            cp -f autoarranque.ini /home/pi/.local/COPIA_SEGURIDAD/Downloads
            
            cd  /home/pi/YSFClients/YSFGateway/
            cp -f YSFGateway.ini /home/pi/.local/COPIA_SEGURIDAD/Downloads
            
            cd /home/pi/bluedv/
            cp -f BlueDVconfig.ini /home/pi/.local/COPIA_SEGURIDAD/Downloads

            cd /etc/svxlink/
            cp -f svxlink.conf /home/pi/.local/COPIA_SEGURIDAD/Downloads

            cd /etc/svxlink/svxlink.d/
            cp -f ModuleEchoLink.conf /home/pi/.local/COPIA_SEGURIDAD/Downloads

            cp /etc/ircddbgateway /home/pi/.local/COPIA_SEGURIDAD/Downloads
            cp /etc/dstarrepeater /home/pi/.local/COPIA_SEGURIDAD/Downloads

            cd /home/pi
            cp info_panel_control.ini /home/pi/.local/COPIA_SEGURIDAD/Downloads

indicativo=$(awk "NR==2" /opt/MMDVM_Bridge/MMDVM_Bridge.ini)
indicativo=`expr substr $indicativo 10 6`

address_especial=$(awk "NR==70" /opt/MMDVM_Bridge/especial.ini)

id=$(awk "NR==38" /opt/Analog_Bridge/Analog_Bridge.ini)
id=`echo "$id" | tr -d '[[:space:]]'`
id=`expr substr $id 14 7`

id2=$(awk "NR==3" /opt/MMDVM_Bridge/MMDVM_Bridge.ini)
id2=`expr substr $id2 4 9`

Latitude=$(awk "NR==11" /opt/MMDVM_Bridge/MMDVM_Bridge.ini)
Latitude=`expr substr $Latitude 10 10`

Longitude=$(awk "NR==12" /opt/MMDVM_Bridge/MMDVM_Bridge.ini)
Longitude=`expr substr $Longitude 11 10`

port=$(awk "NR==56" /opt/Analog_Bridge/Analog_Bridge.ini)
port=`echo "$port" | tr -d '[[:space:]]'`
port=`expr substr $port 8 5`

location=$(awk "NR==14" /opt/MMDVM_Bridge/MMDVM_Bridge.ini)

url=$(awk "NR==16" /opt/MMDVM_Bridge/MMDVM_Bridge.ini)
url=`expr substr $url 5 30`

password_especial=$(awk "NR==74" /opt/MMDVM_Bridge/especial.ini)

port_especial=$(awk "NR==71" /opt/MMDVM_Bridge/especial.ini)

sala_fcs=$(awk "NR==40" /opt/Analog_Bridge/FCS.ini)
sala_fcs=`echo "$sala_fcs" | tr -d '[[:space:]]'`
sala_fcs=`expr substr $sala_fcs 6 20`

sala_nxdn=$(awk "NR==10" /opt/NXDNClients/NXDNGateway/private/NXDNHosts.txt)

selfcare=$(awk "NR==74" /opt/MMDVM_Bridge/brandmeister_esp.ini)

reflector_dstar=$(awk "NR==18" /etc/ircddbgateway)

# Copia todos los datos de Dvswitch /home/pi/.local/COPIA_SEGURIDAD/Downloads
sed -i "1c $indicativo" /home/pi/.local/COPIA_SEGURIDAD/Downloads/datos_dvswitch
sed -i "2c $address_especial" /home/pi/.local/COPIA_SEGURIDAD/Downloads/datos_dvswitch
sed -i "3c $id" /home/pi/.local/COPIA_SEGURIDAD/Downloads/datos_dvswitch
sed -i "4c $id2" /home/pi/.local/COPIA_SEGURIDAD/Downloads/datos_dvswitch
sed -i "5c $Latitude" /home/pi/.local/COPIA_SEGURIDAD/Downloads/datos_dvswitch
sed -i "6c $Longitude" /home/pi/.local/COPIA_SEGURIDAD/Downloads/datos_dvswitch
sed -i "7c $port" /home/pi/.local/COPIA_SEGURIDAD/Downloads/datos_dvswitch
sed -i "8c $location" /home/pi/.local/COPIA_SEGURIDAD/Downloads/datos_dvswitch
sed -i "9c $url" /home/pi/.local/COPIA_SEGURIDAD/Downloads/datos_dvswitch
sed -i "10c $password_especial" /home/pi/.local/COPIA_SEGURIDAD/Downloads/datos_dvswitch
sed -i "11c $port_especial" /home/pi/.local/COPIA_SEGURIDAD/Downloads/datos_dvswitch
sed -i "12c $sala_fcs" /home/pi/.local/COPIA_SEGURIDAD/Downloads/datos_dvswitch
sed -i "13c $sala_nxdn" /home/pi/.local/COPIA_SEGURIDAD/Downloads/datos_dvswitch
sed -i "14c $selfcare" /home/pi/.local/COPIA_SEGURIDAD/Downloads/datos_dvswitch
sed -i "15c $reflector_dstar" /home/pi/.local/COPIA_SEGURIDAD/Downloads/datos_dvswitch

sudo chmod 777 -R /home/pi/.local/COPIA_SEGURIDAD

exit;
;;

*)
clear
echo "${ROJO}"
echo "\v\v\v\v"
echo " ******************************************************************************"
echo " ******************  NO SE HIZO COPIA, VOLVIENDO AL MENU  *********************"
echo " ******************************************************************************"
sleep 3

;;
esac
#exit;
break;
done;;
2) echo ""
while true
do
clear
            echo "\33[1;36m" #color cian
            read -p 'QUIERES SEGUIR ADELANTE S/N ? ' sino
            case $sino in
            s|S) 
            clear
            echo "\33[1;32m" #color verde
echo "${VERDE}"
echo "\v\v\v\v"
echo " ******************************************************************************"
echo " *******************  SE ESTÁ REALIZANDO LA RESTAURACIÓN  *********************"
echo " *********************  ${ROJO}AL ACABAR SE CERRARÁ EL TERMINAL  ${VERDE}*********************"
echo " ******************************************************************************"
sleep 3
            cd /home/pi/.local/COPIA_SEGURIDAD/Downloads
            cp -f TODOS_LOS_INIS.ini /home/pi/MMDVMHost

            cp -f MMDVM.ini /home/pi/MMDVMHost
            cp -f MMDVM.ini_copia /home/pi/MMDVMHost
            cp -f MMDVM.ini_copia2 /home/pi/MMDVMHost
            cp -f MMDVM.ini_copia3 /home/pi/MMDVMHost
            cp -f MMDVM.ini_original /home/pi/MMDVMHost

            cp -f MMDVMBM.ini /home/pi/MMDVMHost
            cp -f MMDVMBM.ini_copia /home/pi/MMDVMHost
            cp -f MMDVMBM.ini_copia2 /home/pi/MMDVMHost
            cp -f MMDVMBM.ini_copia3 /home/pi/MMDVMHost 

            cp -f MMDVMPLUS.ini /home/pi/MMDVMHost
            cp -f MMDVMPLUS.ini_copia /home/pi/MMDVMHost
            cp -f MMDVMPLUS.ini_copia2 /home/pi/MMDVMHost
            cp -f MMDVMPLUS.ini_copia3 /home/pi/MMDVMHost

            cp -f MMDVMESPECIAL.ini /home/pi/MMDVMHost
            cp -f MMDVMESPECIAL.ini_copia /home/pi/MMDVMHost
            cp -f MMDVMESPECIAL.ini_copia2 /home/pi/MMDVMHost
            cp -f MMDVMESPECIAL.ini_copia3 /home/pi/MMDVMHost

            #solo Dstar y solo Fusion
            cp -f MMDVMDSTAR.ini /home/pi/MMDVMHost
            cp -f MMDVMFUSION.ini /home/pi/MMDVMHost
            #fin  Dstar y solo Fusion
            
            #DMRGateway
            cp -f DMRGateway.ini /home/pi/MMDVMHost
            cd /home/pi/.local/COPIA_SEGURIDAD/Downloads/DMRGateway
            cp -f DMRGateway.ini /home/pi/DMRGateway
            #Fin DMRGateway

            cd /home/pi/.local/COPIA_SEGURIDAD/Downloads
            cp -f YSF2DMR.ini /home/pi/YSF2DMR
            cp -f YSF2DMR.ini_copia_01 /home/pi/YSF2DMR
            cp -f YSF2DMR.ini_copia_02 /home/pi/YSF2DMR
            cp -f YSF2DMR.ini_copia_03 /home/pi/YSF2DMR
            cp -f YSF2DMR.ini_copia_04 /home/pi/YSF2DMR
            
            cp -f TG-YSFList.txt /home/pi/DMR2YSF
          
            cp -f tg_ysf.txt /home/pi/.local
            cp -f nombre_salas_ysf.txt /home/pi/.local
            cp -f autoarranque.ini /home/pi/.local
            
            cp -f MMDVMDMR2NXDN.ini /home/pi/MMDVMHost
            cp -f MMDVMNXDN.ini /home/pi/MMDVMHost
            cp -f MMDVMDMR2YSF.ini /home/pi/MMDVMHost

            cp -f DMR2NXDN.ini  /home/pi/DMR2NXDN
            cp -f NXDNGateway.ini /home/pi/NXDNClients/NXDNGateway
            cp -f DMR2YSF.ini /home/pi/DMR2YSF

            sudo cp -f YSFGateway.ini /home/pi/YSFClients/YSFGateway/

            sudo cp -f BlueDVconfig.ini /home/pi/bluedv/
           
            sudo cp -f svxlink.conf /etc/svxlink/
            sudo cp -f ModuleEchoLink.conf etc/svxlink/svxlink.d/

            cp ircddbgateway /etc/
            cp dstarrepeater /etc/

            cp info_panel_control.ini /home/pi/

# Restaura todos los datos de Dvswitch
indicativo=$(awk "NR==1" /home/pi/.local/COPIA_SEGURIDAD/Downloads/datos_dvswitch)          
sudo sed -i "2c Callsign=$indicativo" /opt/MMDVM_Bridge/MMDVM_Bridge.ini
sudo sed -i "2c Callsign=$indicativo" /opt/MMDVM_Bridge/brandmeister_esp.ini
sudo sed -i "2c Callsign=$indicativo" /opt/MMDVM_Bridge/dmrplus.ini
sudo sed -i "2c Callsign=$indicativo" /opt/MMDVM_Bridge/especial.ini
sudo sed -i "2c Callsign=$indicativo" /opt/NXDNGateway.ini
sudo sed -i "2c gatewayCallsign=$indicativo" /etc/ircddbgateway
sudo sed -i "95c ircddbUsername=$indicativo" /etc/ircddbgateway
sudo sed -i "117c dplusLogin=$indicativo" /etc/ircddbgateway
sudo sed -i "2c Callsign=$indicativo" /opt/MMDVM_Bridge/MMDVM_Bridge_FCS.ini

id=$(awk "NR==3" /home/pi/.local/COPIA_SEGURIDAD/Downloads/datos_dvswitch)
id_nxdn=`expr substr $id 3 5`
sudo sed -i "30c ID = $id" /opt/MMDVM_Bridge/DVSwitch.ini
sudo sed -i "40c FallbackID = $id" /opt/MMDVM_Bridge/DVSwitch.ini
sudo sed -i "38c gatewayDmrId = $id" /opt/Analog_Bridge/Analog_Bridge.ini
sudo sed -i "38c gatewayDmrId = $id" /opt/Analog_Bridge/dmr.ini
sudo sed -i "38c gatewayDmrId = $id" /opt/Analog_Bridge/dstar.ini
sudo sed -i "38c gatewayDmrId = $id" /opt/Analog_Bridge/especial.ini
sudo sed -i "38c gatewayDmrId = $id" /opt/Analog_Bridge/nxdn.ini
sudo sed -i "43c ;; FallbackID = $id_nxdn" /opt/Analog_Bridge/nxdn.ini
sudo sed -i "44c ;; NXDNFallbackID = $id_nxdn" /opt/Analog_Bridge/nxdn.ini
sudo sed -i "38c gatewayDmrId = $id" /opt/Analog_Bridge/ysf.ini
sudo sed -i "43c ;; FallbackID = $id" /opt/Analog_Bridge/ysf.ini
sudo sed -i "38c gatewayDmrId = $id" /opt/Analog_Bridge/FCS.ini

id2=$(awk "NR==4" /home/pi/.local/COPIA_SEGURIDAD/Downloads/datos_dvswitch)
sudo sed -i "3c Id=$id2" /opt/MMDVM_Bridge/MMDVM_Bridge.ini
sudo sed -i "3c Id=$id2" /opt/MMDVM_Bridge/brandmeister_esp.ini
sudo sed -i "3c Id=$id2" /opt/MMDVM_Bridge/dmrplus.ini
sudo sed -i "3c Id=$id2" /opt/MMDVM_Bridge/especial.ini
sudo sed -i "39c repeaterID = $id2" /opt/Analog_Bridge/Analog_Bridge.ini
sudo sed -i "39c repeaterID = $id2" /opt/Analog_Bridge/dmr.ini
sudo sed -i "39c repeaterID = $id2" /opt/Analog_Bridge/dstar.ini
sudo sed -i "39c repeaterID = $id2" /opt/Analog_Bridge/especial.ini
sudo sed -i "39c repeaterID = $id2" /opt/Analog_Bridge/nxdn.ini
sudo sed -i "39c repeaterID = $id2" /opt/Analog_Bridge/ysf.ini
sudo sed -i "39c repeaterID = $id2" /opt/Analog_Bridge/FCS.ini
sudo sed -i "3c Id=$id2" /opt/MMDVM_Bridge/MMDVM_Bridge_FCS.ini

Latitude=$(awk "NR==5" /home/pi/.local/COPIA_SEGURIDAD/Downloads/datos_dvswitch)
sudo sed -i "11c Latitude=$Latitude" /opt/MMDVM_Bridge/MMDVM_Bridge.ini
sudo sed -i "11c Latitude=$Latitude" /opt/MMDVM_Bridge/brandmeister_esp.ini
sudo sed -i "11c Latitude=$Latitude" /opt/MMDVM_Bridge/dmrplus.ini
sudo sed -i "11c Latitude=$Latitude" /opt/MMDVM_Bridge/especial.ini
sudo sed -i "11c Latitude=$Latitude" /opt/MMDVM_Bridge/MMDVM_Bridge_FCS.ini

Longitude=$(awk "NR==6" /home/pi/.local/COPIA_SEGURIDAD/Downloads/datos_dvswitch)
sudo sed -i "12c Longitude=$Longitude" /opt/MMDVM_Bridge/MMDVM_Bridge.ini
sudo sed -i "12c Longitude=$Longitude" /opt/MMDVM_Bridge/brandmeister_esp.ini
sudo sed -i "12c Longitude=$Longitude" /opt/MMDVM_Bridge/dmrplus.ini
sudo sed -i "12c Longitude=$Longitude" /opt/MMDVM_Bridge/especial.ini
sudo sed -i "12c Longitude=$Longitude" /opt/MMDVM_Bridge/MMDVM_Bridge_FCS.ini

port=$(awk "NR==7" /home/pi/.local/COPIA_SEGURIDAD/Downloads/datos_dvswitch)
sudo sed -i "55c txPort = $port" /opt/Analog_Bridge/Analog_Bridge.ini
sudo sed -i "55c txPort = $port" /opt/Analog_Bridge/dmr.ini
sudo sed -i "55c txPort = $port" /opt/Analog_Bridge/dstar.ini
sudo sed -i "55c txPort = $port" /opt/Analog_Bridge/especial.ini
sudo sed -i "55c txPort = $port" /opt/Analog_Bridge/nxdn.ini
sudo sed -i "55c txPort = $port" /opt/Analog_Bridge/ysf.ini
sudo sed -i "56c rxPort = $port" /opt/Analog_Bridge/Analog_Bridge.ini
sudo sed -i "56c rxPort = $port" /opt/Analog_Bridge/dmr.ini
sudo sed -i "56c rxPort = $port" /opt/Analog_Bridge/dstar.ini
sudo sed -i "56c rxPort = $port" /opt/Analog_Bridge/especial.ini
sudo sed -i "56c rxPort = $port" /opt/Analog_Bridge/nxdn.ini
sudo sed -i "56c rxPort = $port" /opt/Analog_Bridge/ysf.ini


location=$(awk "NR==8" /home/pi/.local/COPIA_SEGURIDAD/Downloads/datos_dvswitch)
sudo sed -i "14c $location" /opt/MMDVM_Bridge/MMDVM_Bridge.ini
sudo sed -i "14c $location" /opt/MMDVM_Bridge/brandmeister_esp.ini
sudo sed -i "14c $location" /opt/MMDVM_Bridge/dmrplus.ini
sudo sed -i "14c $location" /opt/MMDVM_Bridge/especial.ini
#sudo sed -i "17c $location" /opt/NXDNGateway.ini
sudo sed -i "14c $location" /opt/MMDVM_Bridge/MMDVM_Bridge_FCS.ini

url=$(awk "NR==9" /home/pi/.local/COPIA_SEGURIDAD/Downloads/datos_dvswitch)
sudo sed -i "16c URL=$url" /opt/MMDVM_Bridge/MMDVM_Bridge.ini
sudo sed -i "16c URL=$url" /opt/MMDVM_Bridge/brandmeister_esp.ini
sudo sed -i "16c URL=$url" /opt/MMDVM_Bridge/dmrplus.ini
sudo sed -i "16c URL=$url" /opt/MMDVM_Bridge/especial.ini
sudo sed -i "16c URL=$url" /opt/MMDVM_Bridge/MMDVM_Bridge_FCS.ini

address_especial=$(awk "NR==2" /home/pi/.local/COPIA_SEGURIDAD/Downloads/datos_dvswitch)
sudo sed -i "70c $address_especial" /opt/MMDVM_Bridge/especial.ini

password_especial=$(awk "NR==10" /home/pi/.local/COPIA_SEGURIDAD/Downloads/datos_dvswitch)
sudo sed -i "74c $password_especial" /opt/MMDVM_Bridge/especial.ini

port_especial=$(awk "NR==11" /home/pi/.local/COPIA_SEGURIDAD/Downloads/datos_dvswitch)
sudo sed -i "71c $port_especial" /opt/MMDVM_Bridge/especial.ini

sala_fcs=$(awk "NR==12" /home/pi/.local/COPIA_SEGURIDAD/Downloads/datos_dvswitch)
sudo sed -i "40c txTg = $sala_fcs" /opt/Analog_Bridge/FCS.ini
sudo sed -i "42c Startup=$sala_fcs" /home/pi/YSFClients/YSFGateway/YSFGateway.ini


sala_nxdn=$(awk "NR==13" /home/pi/.local/COPIA_SEGURIDAD/Downloads/datos_dvswitch)
sudo sed -i "10c $sala_nxdn" /opt/NXDNClients/NXDNGateway/private/NXDNHosts.txt

selfcare=$(awk "NR==14" /home/pi/.local/COPIA_SEGURIDAD/Downloads/datos_dvswitch)
sudo sed -i "74c $selfcare" /opt/MMDVM_Bridge/brandmeister_esp.ini

reflector_dstar=$(awk "NR==15" /home/pi/.local/COPIA_SEGURIDAD/Downloads/datos_dvswitch)
sudo sed -i "18c $reflector_dstar" /etc/ircddbgateway

exit;
;;
*)

clear
echo "${ROJO}"
echo "\v\v\v\v"
echo " ******************************************************************************"
echo " *******************  NO SE RESTAURÓ, VOLVIENDO AL MENU  *********************"
echo " ******************************************************************************"
sleep 3

;;
esac
#exit;
break;
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

