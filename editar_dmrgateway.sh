#!/bin/bash
while true
do
clear

idioma=$(awk "NR==1" /home/pi/.local/language)
if [ $idioma = English ]; then
OPTION=`cat /home/pi/.local/English.ini`



echo "$OPTION"

read a

#OPTION="Chose an Option"
PUERTO="Port for DVMEGA punctured in Raspberry PI"
INDICATIVO="Enter your call sign"
VALORINDICATIVO="Current value call sign"
SALIR="Exit"
RESTAURAORIGINAL="You want to restore the original file"
SINO="Y/N"
P_RESTAURAORIGINAL="Recover the original file"
MODIFICAR="Change   "
 
else
OPTION=$(awk "NR==1" /home/pi/.local/Spanish.ini)
#OPTION="Elije una opción"
PUERTO="Puerto para DVMEGA pinchado en Raspberri PI"
INDICATIVO="Introduce tu indicativo"
VALORINDICATIVO="Valor actual Indicativo"
SALIR="Salir del script OJO!! no salir con ctrl+c ni con la x"
RESTAURAORIGINAL="Quieres restaurar el fichero original"
SINO="S/N"
P_RESTAURAORIGINAL=" Recuperar fichero original"
MODIFICAR="Modificar"
fi

#Editor DMRGateway Brabdmeister
DIRECTORIO="DMRGateway"

#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
echo "${VERDE}"
echo "   **************************************************************************"
echo "                  Script $MODIFICAR $DIRECTORIO             \33[1;31m by EA3EIZ\33[1;32m   "
echo "   **************************************************************************"

echo -n "${CIAN}   1)${GRIS} $MODIFICAR RXFrequency           - ${AMARILLO}"
contenido_rxf=$(awk "NR==13" /home/pi/MMDVMHost/DMRGateway.ini)
echo "$contenido_rxf"

echo -n "${CIAN}   2)${GRIS} $MODIFICAR TXFrequency           - ${AMARILLO}"
contenido_txf=$(awk "NR==14" /home/pi/MMDVMHost/DMRGateway.ini)
echo "$contenido_txf"

echo -n "${CIAN}   3)${GRIS} $MODIFICAR Location              - ${AMARILLO}"
contenido_location=$(awk "NR==33" /home/pi/DMRGateway/DMRGateway.ini)
echo "$contenido_location"

echo -n "${CIAN}   4)${GRIS} $MODIFICAR URL                   - ${AMARILLO}"
contenido_url=$(awk "NR==35" /home/pi/DMRGateway/DMRGateway.ini)
echo "$contenido_url"

echo -n "${CIAN}   5)${GRIS} $MODIFICAR ID XLX & DMR+         - ${AMARILLO}"
idd1=$(awk "NR==49" /home/pi/DMRGateway/DMRGateway.ini)
echo "$idd1"

echo -n "${CIAN}   6)${GRIS} $MODIFICAR XLX Startup           - ${AMARILLO}"
Startup=$(awk "NR==46" /home/pi/DMRGateway/DMRGateway.ini)
echo "$Startup"

echo -n "${CIAN}   7)${GRIS} $MODIFICAR XLX Module            - ${AMARILLO}"
Module=$(awk "NR==51" /home/pi/DMRGateway/DMRGateway.ini)
echo "$Module"

echo -n "${CIAN}   8)${GRIS} $MODIFICAR Address Brandmeister  - ${AMARILLO}"
address_BM=$(awk "NR==56" /home/pi/DMRGateway/DMRGateway.ini)
echo "$address_BM"

echo -n "${CIAN}   9)${GRIS} $MODIFICAR Address DMR+          - ${AMARILLO}"
address_PLUS=$(awk "NR==73" /home/pi/DMRGateway/DMRGateway.ini)
echo "$address_PLUS"

echo -n "${CIAN}  10)${GRIS} $MODIFICAR Address HBLink        - ${AMARILLO}"
address_HBLink=$(awk "NR==87" /home/pi/DMRGateway/DMRGateway.ini)
echo "$address_HBLink"

echo -n "${CIAN}  11)${GRIS} $MODIFICAR Password HBLink       - ${AMARILLO}"
password_HBLink=$(awk "NR==90" /home/pi/DMRGateway/DMRGateway.ini)
echo "$password_HBLink"

echo ""
echo "${CIAN}   0)\33[1;31m $SALIR"
echo ""
echo -n "${CIAN}   $OPTION:" 
read escoger_menu
case $escoger_menu in
1) echo ""
while true
do
                          echo "Valor actual del RXFrequency: ${AMARILLO}${contenido_rxf#*=}\33[1;37m"
           	              read -p 'Introduce RXFrequency:        ' rxfre
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
                          sed -i "13c RXFrequency=$rxfre" /home/pi/MMDVMHost/DMRGateway.ini
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
2) echo ""
while true
do
                          echo "Valor actual del TXFrequency: ${AMARILLO}${contenido_txf#*=}\33[1;37m"
                          read -p 'Introduce TXFrequency:        ' txfre
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sed -i "14c TXFrequency=$txfre" /home/pi/MMDVMHost/DMRGateway.ini
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
3) echo ""
while true
do
                          echo "Valor de la Ciudad: ${AMARILLO}${contenido_location#*=}\33[1;37m"
                          read -p 'Introduce tu Ciudad ' loc1
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
                          sed -i "33c Location=$loc1" /home/pi/DMRGateway/DMRGateway.ini
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
4) echo ""
while true
do
                          echo "Valor de  la  URL   Web: ${AMARILLO}${contenido_url#*=}\33[1;37m"
           	              read -p 'Introduce URL de tu Web: ' ur1
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
			                    ur1=`echo "$ur1" | tr -d '[[:space:]]'`
                          sed -i "35c URL=$ur1" /home/pi/DMRGateway/DMRGateway.ini
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
5) echo ""
while true
do
                          echo "Valor  actual  del Id: ${AMARILLO}${idd#*=}\33[1;37m"
                          read -p 'Introduce un ID válido ' miid
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sed -i "49c Id=$miid" /home/pi/DMRGateway/DMRGateway.ini
                          sed -i "80c Id=$miid" /home/pi/DMRGateway/DMRGateway.ini
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
6) echo ""
while true
do
                          

                          echo "Valor  actual  del XLX: ${AMARILLO}${Startup#*=}\33[1;37m"
                          read -p 'Introduce el número del XLX ' xlx
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sed -i "46c Id=$xlx" /home/pi/DMRGateway/DMRGateway.ini
                          break;;
                          [nN]* ) echo ""
                          break;;
esac                          
done;;
7) echo ""
while true
do
                          echo "Valor actual del Module XLX: ${AMARILLO}${Module#*=}\33[1;37m"
                          read -p 'Introduce la letra del Module XLX ' modu
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          modu=`echo "$modu" | tr [:lower:] [:upper:]`
                          sed -i "51c Id=$modu" /home/pi/DMRGateway/DMRGateway.ini
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
8) echo ""
while true
do
                      echo "Valor actual del Master: ${AMARILLO}${address_BM#*=}\33[1;37m"
                      read -p 'Brandmeister Spain = master.spain-dmr.es: ' master
                      actualizar=S 
                      case $actualizar in
                      [sS]* ) echo ""
                      master=`echo "$master" | tr -d '[[:space:]]'`
                      master=`echo "$master" | tr [:upper:] [:lower:]`
                      sed -i "56c Address=$master" /home/pi/DMRGateway/DMRGateway.ini
                      break;;
                      [nN]* ) echo ""
                      break;;
esac
done;;
9) echo ""
while true
do
                     
                      echo "Valor actual del Master: ${AMARILLO}${address_PLUS#*=}\33[1;37m"
                      read -p 'Address DMR+ Spain IPSC2-EA-Hotspot = 212.237.3.141: ' master1
                      actualizar=S 
                      case $actualizar in
                      [sS]* ) echo ""
                      master1=`echo "$master1" | tr -d '[[:space:]]'`
                      master1=`echo "$master1" | tr [:upper:] [:lower:]`
                      sed -i "73c Address=$master1" /home/pi/DMRGateway/DMRGateway.ini
                      break;;
                      [nN]* ) echo ""
                      break;;
esac
done;;

10) echo ""
while true
do
                      echo "Valor actual del Master: ${AMARILLO}${address_HBLink#*=}\33[1;37m"
                      read -p 'Introduce Address del HBLink: ' master2
                      actualizar=S 
                      case $actualizar in
                      [sS]* ) echo ""
                      master2=`echo "$master2" | tr -d '[[:space:]]'`
                      master2=`echo "$master2" | tr [:upper:] [:lower:]`
                      sed -i "87c Address=$master2" /home/pi/DMRGateway/DMRGateway.ini
                      break;;
                      [nN]* ) echo ""
                      break;;
esac
done;;
11) echo ""
while true
do
                          echo "Valor actual del Password HBLink: ${AMARILLO}${password_HBLink#*=}\33[1;37m"
           	              read -p 'Introduce el Password para HBLink: ' pas1
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
			                    pas1=`echo "$pas1" | tr -d '[[:space:]]'`
                          sed -i "90c Password=$pas1" /home/pi/DMRGateway/DMRGateway.ini
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
0) echo ""
exit;;	
esac
done