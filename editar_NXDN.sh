#!/bin/bash
clear
while true
do
clear
# path usuario
usuario=$(awk "NR==1" /home/pi/.config/autostart/usuario)
SCRIPTS_version=$(awk "NR==1" $usuario/.config/autostart/version)

DIRECTORIO="MMDVMNXDN.ini"

#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"

echo "${VERDE}"
echo "   ********************************************************************"
echo -n "${CIAN}"
echo "               Script para Modificar $DIRECTORIO   "
echo -n "${ROJO}"
echo "                             $SCRIPTS_version by EA3EIZ"
echo -n "${VERDE}"
echo "   ********************************************************************"

echo -n "\33[1;36m   1)\33[0m Modificar indicativo  - \33[1;33m"
ind=`grep -n -m 1 "Callsign" $usuario/MMDVMHost/$DIRECTORIO`
ind1=`expr substr $ind 3 30`
echo "${VERDE}$ind1"

echo -n "\33[1;36m   2)\33[0m Modificar RXFrequency - \33[1;33m"
rxf=`grep -n "RXFrequency" $usuario/MMDVMHost/$DIRECTORIO`
rxf1=`expr substr $rxf 4 30`
echo "${VERDE}$rxf1"

echo -n "\33[1;36m   3)\33[0m Modificar TXFrequency - \33[1;33m"
txf=`grep -n "TXFrequency" $usuario/MMDVMHost/$DIRECTORIO`
txf1=`expr substr $txf 4 30`
echo "${VERDE}$txf1"

echo -n "${CIAN}   4)${GRIS} Modificar Location    - ${AMARILLO}"
loc=`grep -n "^Location=" $usuario/MMDVMHost/$DIRECTORIO`
loc1=`echo "$loc" | tr -d '[[:space:]]'`
buscar=":"
largo_linea=`expr index $loc1 $buscar`
largo_linea=`expr $largo_linea - 1`
numero_linea=`expr substr $loc1 1 $largo_linea`
letrac=c
numero_linea_letrac=$numero_linea$letrac
contenido_location=$(awk "NR==$numero_linea" $usuario/MMDVMHost/$DIRECTORIO)
echo "$contenido_location"

echo -n "\33[1;36m   5)\33[0m Modificar URL         - \33[1;33m"
url=`grep -n "URL" $usuario/MMDVMHost/$DIRECTORIO`
url1=`expr substr $url 4 30`
echo "$url1"

echo "\33[1;36m   6)\33[0m Puerto para DVMEGA pinchado en Raspberri PI (ttyAMA0)\33[1;33m"
echo "\33[1;36m   7)\33[0m Puerto para placa NTH/ZUM en arduino y Pincho Low Cost (ttyACM0)\33[1;33m"
echo "\33[1;36m   8)\33[0m Puerto para placa NTH/ZUM en arduino y Pincho Low Cost (ttyACM1)\33[1;33m"
echo "\33[1;36m   9)\33[0m Puerto para DVMEGA + Bluestack conectado por USB a Raspberry Pi(ttyUSB0)\33[1;33m"
echo -n "                            - "

mode=`grep -n -m 1 "^Port=" $usuario/MMDVMHost/$DIRECTORIO`
buscar=":"
caracteres=`expr index $mode $buscar`
caracteres_linea=`expr $caracteres - 1`
numero_linea_port=`expr substr $mode 1 $caracteres_linea`
mode=$(awk "NR==$numero_linea_port" $usuario/MMDVMHost/$DIRECTORIO)
echo "$mode"

echo -n "\33[1;36m  10)\33[0m Modificar ID          - \33[1;33m"
idd=`grep -n "^Id=" $usuario/MMDVMHost/$DIRECTORIO`
idd1=`expr substr $idd 3 30`
echo "${VERDE}$idd1"

echo -n "\33[1;36m  11)\33[0m Modificar Address     - \33[1;33m"
master=`grep -n -m 1 "^Address=" $usuario/MMDVMHost/$DIRECTORIO`
buscar=":"
largo=`expr index $master $buscar`
largo=`expr $largo + 1`
largo1=`expr $largo - 2`
master1=`expr substr $master $largo 40`
largo=`expr substr $master 1 $largo1`
letra=c            
linea_master=$largo$letra
echo "${VERDE}$master1"

echo -n "\33[1;36m  12)\33[0m Modificar Puerto      - \033[1;32m"
lineaport=`expr substr $master 1 $largo1`
lineaport=`expr $lineaport + 1`
linea3port=$lineaport
letra=p
linea2port=$lineaport$letra
var100port= sed -n $linea2port  $usuario/MMDVMHost/$DIRECTORIO;

echo -n "\33[1;36m  13)\33[0m Modificar Password    - \33[1;33m"
pas=`grep -n '\<Password\>' $usuario/MMDVMHost/$DIRECTORIO`
pas1=`expr substr $pas 5 30`
echo "$pas1"

echo -n "\33[1;36m  14)\33[0m Modificar TXInvert    - \33[1;33m"
txinv=`grep -n '\<TXInvert\>' $usuario/MMDVMHost/$DIRECTORIO`
txinv1=`expr substr $txinv 4 30`
echo -n "$txinv1"

echo -n "\33[1;36m      a)\33[0m D-STAR      - \33[1;33m"
dstar=`grep -n "\[D-Star\]" $usuario/MMDVMHost/$DIRECTORIO` # devuelve ejem: 74:Enable=1
buscar=":"
largo_linea=`expr index $dstar $buscar` #comprueba el largo incluyendo los dos puntos (:)
largo_linea=`expr $largo_linea - 1` #comprueba el largo quitando los dos puntos (:)
numero_linea=`expr substr $dstar 1 $largo_linea` # recoge el numero de linea (74)
numero_linea_dstar=`expr $numero_linea + 1` # y le suma uno qudando coomo: (75)
letra=p
numero_linea_dstar_letrap=$numero_linea_dstar$letra #crea 74p
letrac=c
numero_linea_dstar_letrac=$numero_linea_dstar$letrac #crea 74c
presentar_valo= sed -n $numero_linea_dstar_letrap  $usuario/MMDVMHost/$DIRECTORIO; #presenta el valor en pantalla

echo -n "\33[1;36m  15)\33[0m Modificar RXLevel     - \33[1;33m"
rx=`grep -n '\<RXLevel\>' $usuario/MMDVMHost/$DIRECTORIO`
rx1=`expr substr $rx 4 30`
echo -n "$rx1"

echo -n "\33[1;36m      b)\33[0m DMR         - \33[1;33m"
dmr=`grep -n "\[DMR\]" $usuario/MMDVMHost/$DIRECTORIO` # devuelve ejem: 74:Enable=1
buscar=":"
largo_linea=`expr index $dmr $buscar` #comprueba el largo incluyendo los dos puntos (:)
largo_linea=`expr $largo_linea - 1` #comprueba el largo quitando los dos puntos (:)
numero_linea=`expr substr $dmr 1 $largo_linea` # recoge el numero de linea (74)
numero_linea_dmr=`expr $numero_linea + 1` # y le suma uno qudando coomo: (75)
letra=p
numero_linea_dmr_letrap=$numero_linea_dmr$letra #crea 74p
letrac=c
numero_linea_dmr_letrac=$numero_linea_dmr$letrac #crea 74c
presentar_valor= sed -n $numero_linea_dmr_letrap  $usuario/MMDVMHost/$DIRECTORIO; #presenta el valor en pantalla

echo -n "\33[1;36m  16)\33[0m Modificar TXLevel     - \33[1;33m"
tx=`grep -n -m 1 '\<TXLevel\>' $usuario/MMDVMHost/$DIRECTORIO`
tx1=`expr substr $tx 4 30`
echo -n "$tx1"

echo -n "\33[1;36m      c)\33[0m FUSION      - \33[1;33m"
fusion=`grep -n "LowDeviation" $usuario/MMDVMHost/$DIRECTORIO` # devuelve ejem: 74:Enable=1
buscar=":"
largo_linea=`expr index $fusion $buscar` #comprueba el largo incluyendo los dos puntos (:)
largo_linea=`expr $largo_linea - 1` #comprueba el largo quitando los dos puntos (:)
numero_linea=`expr substr $fusion 1 $largo_linea` # recoge el numero de linea ejemplo (74)
numero_linea_fusion=`expr $numero_linea - 1` # y le resta uno quedando como: ejemplo (73)
letra=p
numero_linea_fusion_letrap=$numero_linea_fusion$letra #crea 74p
letrac=c
numero_linea_fusion_letrac=$numero_linea_fusion$letrac #crea 74c
presentar_valor= sed -n $numero_linea_fusion_letrap  $usuario/MMDVMHost/$DIRECTORIO; #presenta el valor en pantalla

echo -n "\33[1;36m  17)\33[0m Modificar Duplex      - \33[1;33m"
dup=`grep -n -m 1 '\<Duplex\>' $usuario/MMDVMHost/$DIRECTORIO`
dup1=`expr substr $dup 3 30`
echo -n "$dup1"

echo -n "\33[1;36m        d)\33[0m P25         - \33[1;33m"
p25=`grep -n "\[P25\]" $usuario/MMDVMHost/$DIRECTORIO` # devuelve ejem: 74:Enable=1
buscar=":"
largo_linea=`expr index $p25 $buscar` #comprueba el largo incluyendo los dos puntos (:) 
largo_linea=`expr $largo_linea - 1` #comprueba el largo quitando los dos puntos (:)
numero_linea=`expr substr $p25 1 $largo_linea` # recoge el numero de linea (74)
numero_linea_p25=`expr $numero_linea + 1` # y le suma uno qudando coomo: (75)
letra=p
numero_linea_p25_letrap=$numero_linea_p25$letra #crea 74p
letrac=c
numero_linea_p25_letrac=$numero_linea_p25$letrac #crea 74c
presentar_valor= sed -n $numero_linea_p25_letrap  $usuario/MMDVMHost/$DIRECTORIO; #presenta el valor en pantalla

echo -n "\33[1;36m  18)\33[0m Modificar TXHang      - \33[1;33m"
txh=`grep -n -m 1 '\<TXHang\>' $usuario/MMDVMHost/$DIRECTORIO`
txh1=`expr substr $txh 5 30`
echo -n "$txh1"

echo -n "\33[1;36m        e)\33[0m Baliza      - \33[1;33m"
cw= sed -n "31p"  $usuario/MMDVMHost/$DIRECTORIO; #presenta el valor en pantalla

echo -n "\33[1;36m  19)\33[0m Modificar Tramas      - \33[1;33m"
lg=`grep -n -m 1 '\<DisplayLevel\>' $usuario/MMDVMHost/$DIRECTORIO`
lg1=`expr substr $lg 4 30`
echo -n "$lg1"

echo -n "\33[1;36m  f)\33[0m RFModeHang  - \33[1;33m"
modehang=`grep -n -m 1 -c '\<RFModeHang\>' $usuario/MMDVMHost/$DIRECTORIO`
if [ $modehang = 0 ]; then
echo "\33[1;31mEsta versión MMDVMHost no trae este parámetro"
else
modehang=`grep -n -m 1 '\<RFModeHang\>' $usuario/MMDVMHost/$DIRECTORIO`
modehang1=`expr substr $modehang 3 30`
echo "$modehang1"
fi

echo -n "\33[1;36m  20)\33[0m Modificar Slot1       - \33[1;33m"
sl=`grep -n -m 1 '\<Slot1\>' $usuario/MMDVMHost/$DIRECTORIO`
sl1=`expr substr $sl 5 30`
echo -n "$sl1"

echo -n "\33[1;36m         g)\33[0m Timeout     - \33[1;33m"
timeo=`grep -n -m 1 -c '\<Timeout\>' $usuario/MMDVMHost/$DIRECTORIO`
if [ $timeo = 0 ]; then
echo "\33[1;31mEsta versión MMDVMHost no trae este parámetro"
else
timeo=`grep -n -m 1 '\<Timeout\>' $usuario/MMDVMHost/$DIRECTORIO`
timeo1=`expr substr $timeo 3 30`
echo "$timeo1"
fi

echo -n "\33[1;36m  21)\33[0m Tipo Pantalla Display - \33[1;33m"
Display=`grep -n -m 1 -c '\<Display\>' $usuario/MMDVMHost/$DIRECTORIO`
if [ $Display = 0 ]; then
echo "\33[1;31mEsta versión MMDVMHost no trae este parámetro"
else
Display=`grep -n -m 1 '\<Display\>' $usuario/MMDVMHost/$DIRECTORIO`
Display1=`expr substr $Display 3 30`
echo -n "$Display1"
fi

var=`grep -n -m 1 "\[Nextion\]" $usuario/MMDVMHost/$DIRECTORIO`
buscar=":"
largo_linea=`expr index $var $buscar`
largo_linea=`expr $largo_linea - 1`
numero_linea=`expr substr $var 1 $largo_linea`
numero_linea=`expr $numero_linea + 2` # y le suma uno qudando coomo: (75)
MODEMNEXTION=$(awk "NR==$numero_linea" $usuario/MMDVMHost/$DIRECTORIO)
letra=c
linea_sed_MN=$numero_linea$letra
echo " ${CIAN}h) ${GRIS}Port Nextion- ${AMARILLO}$MODEMNEXTION"

echo -n "\33[1;36m  22)\33[0m Version Display       - \33[1;33m"
ScreenLayout=`grep -n -m 1 -c '\<ScreenLayout\>' $usuario/MMDVMHost/$DIRECTORIO`
if [ $ScreenLayout = 0 ]; then
echo "\33[1;31mEsta versión MMDVMHost no trae este parámetro"
else
ScreenLayout=`grep -n -m 1 '\<ScreenLayout\>' $usuario/MMDVMHost/$DIRECTORIO`
ScreenLayout1=`expr substr $ScreenLayout 5 30`
echo -n "$ScreenLayout1"
fi

var=`grep -n -m 1 "\[NXDN\]" $usuario/MMDVMHost/$DIRECTORIO`
buscar=":"
largo_linea=`expr index $var $buscar`
largo_linea=`expr $largo_linea - 1`
numero_linea=`expr substr $var 1 $largo_linea`
numero_linea=`expr $numero_linea + 1` # Se le suma 1 al número de linea
NXDN=$(awk "NR==$numero_linea" $usuario/MMDVMHost/$DIRECTORIO)
letra=c
linea_sed_NXDN=$numero_linea$letra
echo "  ${CIAN}i) ${GRIS}NXDN        - ${AMARILLO}$NXDN"

echo -n "\33[1;36m  23)\33[0m Brillo Display Nextion- \33[1;33m"
Brightness=`grep -n -m 1 -c '\<Brightness\>' $usuario/MMDVMHost/$DIRECTORIO`
if [ $Brightness = 0 ]; then
echo "\33[1;31mEsta versión MMDVMHost no trae este parámetro"
else
Brightness=`grep -n -m 1 '\<Brightness\>' $usuario/MMDVMHost/$DIRECTORIO`
Brightness1=`expr substr $Brightness 5 30`
echo -n "$Brightness1"
fi

# j) POCSAG Enable=
var=`grep -n -m 1 "\[POCSAG\]" $usuario/MMDVMHost/$DIRECTORIO`
buscar=":"
largo_linea=`expr index $var $buscar`
largo_linea=`expr $largo_linea - 1`
numero_linea=`expr substr $var 1 $largo_linea`
numero_linea=`expr $numero_linea + 1` # Se le suma 1 al número de linea
POCSAG=$(awk "NR==$numero_linea" $usuario/MMDVMHost/$DIRECTORIO)
letra=c
linea_sed_POCSAG=$numero_linea$letra
echo "  ${CIAN} j) ${GRIS}POCSAG      - ${AMARILLO}$POCSAG"

echo -n "\33[1;36m  24)\33[0m Coordenada Latitud    - \33[1;33m"
lat=`grep -n "Latitude" $usuario/MMDVMHost/$DIRECTORIO`
lat1=`expr substr $lat 4 30`
echo "$lat1"

echo -n "\33[1;36m  25)\33[0m Coordenada Longitud   - \33[1;33m"
long=`grep -n "Longitude" $usuario/MMDVMHost/$DIRECTORIO`
long1=`expr substr $long 4 30`
echo "$long1"

echo -n "\33[1;36m  26)\33[0m Modulo D-STAR         - \33[1;33m"
modu=`grep -n -m 1 '\<Module\>' $usuario/MMDVMHost/$DIRECTORIO`
modu1=`expr substr $modu 4 30`
echo "$modu1"

echo -n "\33[1;36m  27)\33[0m Entra reflector DMR+  - \33[1;33m"
OPCION=`expr substr $pas 1 $largo1`
OPCION=`expr $OPCION + 1`
linea33port=$OPCION
letra=p
linea22port=$OPCION$letra
var300port= sed -n $linea22port  $usuario/MMDVMHost/$DIRECTORIO;

echo "\33[1;36m  28)${BLANCO} Abrir fichero $DIRECTORIO para hacer cualquier cambio\33[1;33m"

echo -n "\33[1;36m  29)${GRIS} Local port            - ${VERDE}"
var1=`grep -n "\[DMR Network\]" $usuario/MMDVMHost/$DIRECTORIO` # devuelve ejem: 138:Enable=1
var=`echo "$var1" | tr -d '[[:space:]]'`
buscar=":"
largo_linea=`expr index $var $buscar`
largo_linea=`expr $largo_linea - 1`
numero_linea=`expr substr $var 1 $largo_linea`
numero_linea=`expr $numero_linea + 5`
Local=$(awk "NR==$numero_linea" $usuario/MMDVMHost/$DIRECTORIO)
letra=c
linea_sed_29=$numero_linea$letra
echo "$Local"
echo ""
indi=$(awk "NR==2" $usuario/NXDNClients/NXDNGateway/NXDNGateway.ini)
echo "  ${ROJO}PARAMETROS NXDNGateway.ini "
echo "  ${CIAN} 1)${GRIS} Modificar Indicativo  - ${VERDE}$indi"

rxf=$(awk "NR==11" $usuario/NXDNClients/NXDNGateway/NXDNGateway.ini)
echo "  ${CIAN} 2)${GRIS} Modificar RXFrequency - ${VERDE}$rxf"

txf=$(awk "NR==12" $usuario/NXDNClients/NXDNGateway/NXDNGateway.ini)
echo "  ${CIAN} 3)${GRIS} Modificar TXFrequency - ${VERDE}$txf"

echo -n " ${CIAN} 30)${GRIS} Modificar Daemon      - ${VERDE}"
dae=$(awk "NR==8" $usuario/NXDNClients/NXDNGateway/NXDNGateway.ini)
echo "$dae"

echo -n " ${CIAN} 31)${GRIS} Sala NXDN a conectar  - ${VERDE}"
var=`grep -n -m 1 '\<Startup\>' $usuario/NXDNClients/NXDNGateway/NXDNGateway.ini`
buscar=":"
largo_linea=`expr index $var $buscar`
largo_linea=`expr $largo_linea - 1`
numero_linea=`expr substr $var 1 $largo_linea`
sala=$(awk "NR==$numero_linea" $usuario/NXDNClients/NXDNGateway/NXDNGateway.ini)
letra=c
linea_sed_31=$numero_linea$letra
echo "$sala"

echo -n " ${CIAN} 32)${GRIS} InactivityTimeout     - ${VERDE}"
var=`grep -n -m 1 '\<InactivityTimeout\>' $usuario/NXDNClients/NXDNGateway/NXDNGateway.ini`
buscar=":"
largo_linea=`expr index $var $buscar`
largo_linea=`expr $largo_linea - 1`
numero_linea=`expr substr $var 1 $largo_linea`
Inact=$(awk "NR==$numero_linea" $usuario/NXDNClients/NXDNGateway/NXDNGateway.ini)
letra=c
linea_sed_32=$numero_linea$letra
echo "$Inact"
echo ""

echo "\33[1;36m  33)${AMARILLO} Actualizar listado NXDNHosts.txt"

echo ""
echo "   ${ROJO}0) Salir"
echo ""
echo -n "\33[1;36m   Elige una opción: " 
read escoger_menu

case $escoger_menu in
1) echo ""
while true
do
buscar=":"
largo=`expr index $ind $buscar`
echo "Valor actual Indicativo: \33[1;33m${ind#*=}\33[1;37m"
           	          read -p 'Introduce tu indicativo: ' indicativo
                          letra=c
                          if [ $largo = 3 ]
                          then
                          linea=`expr substr $ind 1 1`
                          else
                          linea=`expr substr $ind 1 1`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in
			              [sS]* ) echo ""
#Convierte indicativo si se introduce en minúsculas a Mayúsculas
indicativo=`echo "$indicativo" | tr [:lower:] [:upper:]`

			              indicativo=`echo "$indicativo" | tr -d '[[:space:]]'`
sed -i "$linea Callsign=$indicativo" $usuario/MMDVMHost/$DIRECTORIO
sed -i "2c Callsign=$indicativo" $usuario/NXDNClients/NXDNGateway/NXDNGateway.ini
indi=$(awk "NR==2" $usuario/MMDVMHost/$DIRECTORIO)
sed -i "1c $indi" $usuario/info_panel_control.ini
sed -i "40c $indicativo" $usuario/info_panel_control.ini #escribe solo el indicativ
			  break;;
			  [nN]* ) echo ""
			  break;;
esac
done;;
2) echo ""
while true
do
buscar=":"
largo=`expr index $rxf $buscar`
echo "Valor actual del RXFrequency: \33[1;33m${rxf#*=}\33[1;37m"

           	          read -p 'Introduce RXFrequency:        ' var2
                          letra=c
                          if [ $largo = 3 ]
                          then
                          linea=`expr substr $rxf 1 2`
                          else
                          linea=`expr substr $rxf 1 3`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in
			  [sS]* ) echo ""
                              sed -i "13c RXFrequency=$var2" $usuario/MMDVMHost/$DIRECTORIO

frec=$(awk "NR==13" $usuario/MMDVMHost/$DIRECTORIO)
sed -i "11c RXFrequency=$var2" $usuario/NXDNClients/NXDNGateway/NXDNGateway.ini
sed -i "3c $frec" $usuario/info_panel_control.ini


			break;;
			[nN]* ) echo ""
			break;;
esac
done;;
3) echo ""
while true
do
buscar=":"
largo=`expr index $txf $buscar`
echo "Valor actual del TXFrequency: \33[1;33m${txf#*=}\33[1;37m"

           	          read -p 'Introduce TXFrequency:        ' var2
                          letra=c
                          if [ $largo = 3 ]
                          then
                          linea=`expr substr $txf 1 2`
                          else
                          linea=`expr substr $txf 1 3`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in
			  [sS]* ) echo ""
                          sed -i "14c TXFrequency=$var2" $usuario/MMDVMHost/$DIRECTORIO
                          sed -i "12c TXFrequency=$var2" $usuario/NXDNClients/NXDNGateway/NXDNGateway.ini
			  break;;
			  [nN]* ) echo ""
			  break;;
esac
done;;
4) echo ""
while true
do
                          echo "Valor de la Ciudad: ${AMARILLO}${contenido_location#*=}\33[1;37m"
                          read -p 'Introduce tu Ciudad ' loc1
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sed -i "$numero_linea_letrac Location=$loc1" $usuario/MMDVMHost/$DIRECTORIO
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
5) echo ""
while true
do
buscar=":"
largo=`expr index $url $buscar`
echo "Valor de  la  URL   Web: \33[1;33m${url#*=}\33[1;37m"
           	          read -p 'Introduce URL de tu Web: ' ur1
                          letra=c
                          if [ $largo = 3 ]
                          then
                          linea=`expr substr $url 1 2`
                          else
                          linea=`expr substr $url 1 3`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in
			  [sS]* ) echo ""
			  ur1=`echo "$ur1" | tr -d '[[:space:]]'`
                          sed -i "$linea URL=$ur1" $usuario/MMDVMHost/$DIRECTORIO
			  break;;
			  [nN]* ) echo ""
			  break;;
esac
done;;
6) echo ""
while true
do
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""                       
                          letrac=c
                          numero_linea_port=$numero_linea_port$letrac
                          sed -i "$numero_linea_port Port=/dev/ttyAMA0" $usuario/MMDVMHost/$DIRECTORIO
			  break;;
			  [nN]* ) echo ""
			  break;;
esac
done;;
7) echo ""
while true
do
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
                          letrac=c
                          numero_linea_port=$numero_linea_port$letrac
                          sed -i "$numero_linea_port Port=/dev/ttyACM0" $usuario/MMDVMHost/$DIRECTORIO
			  break;;
			  [nN]* ) echo ""
			  break;;
esac
done;;
8) echo ""
while true
do
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
                          letrac=c
                          numero_linea_port=$numero_linea_port$letrac
                          sed -i "$numero_linea_port Port=/dev/ttyACM1" $usuario/MMDVMHost/$DIRECTORIO
			  break;;
			  [nN]* ) echo ""
			  break;;
esac
done;;
9) echo ""
while true
do
                     
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
                          letrac=c
                          numero_linea_port=$numero_linea_port$letrac
                          sed -i "$numero_linea_port Port=/dev/ttyUSB0" $usuario/MMDVMHost/$DIRECTORIO
			  break;;
			  [nN]* ) echo ""
			  break;;
esac
done;;

10) echo ""
while true
do
buscar=":"
largo=`expr index $idd $buscar`
echo "Valor  actual  del Id: \33[1;33m${idd#*=}\33[1;37m"
           	          read -p 'Introduce un ID válido ' miid
                          letra=c
                          if [ $largo = 3 ]
                          then
                          linea=`expr substr $idd 1 1`
                          else
                          linea=`expr substr $idd 1 1`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
                          sed -i "3c Id=$miid" $usuario/MMDVMHost/$DIRECTORIO
                          

                          ide=$(awk "NR==3" $usuario/MMDVMHost/$DIRECTORIO)
                          sed -i "2c $ide" $usuario/info_panel_control.ini
                        
			  break;;
			  [nN]* ) echo ""
			  break;;
esac
done;;
11) echo ""
while true
do
echo "Valor actual del Master: \33[1;33m${master#*=}\33[1;37m"
                      read -p 'El Address debe de ser 127.0.0.1 ' master1
                          actualizar=S 
                          case $actualizar in
                    [sS]* ) echo ""
                    master1=`echo "$master1" | tr -d '[[:space:]]'`
                    letra=c            
                    linea=$largo$letra


#Convierte mayusculas en minúsculas
master1=`echo "$master1" | tr [:upper:] [:lower:]`

                          sed -i "$linea_master Address=$master1" $usuario/MMDVMHost/$DIRECTORIO

master=$(awk "NR==139" $usuario/MMDVMHost/$DIRECTORIO)
sed -i "4c $master" $usuario/info_panel_control.ini

        break;;
        [nN]* ) echo ""
        break;;
esac
done;;
12) echo ""
while true
do
                          echo -n "Valor actual del \33[1;37m${var100port#*=}\33[1;37m"
                          var100port= sed -n $linea2port  $usuario/MMDVMHost/$DIRECTORIO;
                      read -p 'Introducir el Puerto: 62031 ' miid
                          actualizar=S 
                          case $actualizar in
        [sS]* ) echo ""
                          letra1=c
                          linea4=$linea3port$letra1
                          sed -i "$linea4 Port=$miid" $usuario/MMDVMHost/$DIRECTORIO
        break;;
        [nN]* ) echo ""
        break;;
esac
done;;
13) echo ""
while true
do
buscar=":"
largo=`expr index $pas $buscar`
echo "   Valor actual del Password: \33[1;33m${pas#*=}\33[1;37m"
           	          read -p '   Introduce el password que corresponda: ' pas1
                          letra=c
                          if [ $largo = 3 ]
                          then
                          linea=`expr substr $pas 1 2`
                          else
                          linea=`expr substr $pas 1 3`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in
			              [sS]* ) echo ""
			              pas1=`echo "$pas1" | tr -d '[[:space:]]'`
                          sed -i "$linea Password=$pas1" $usuario/MMDVMHost/$DIRECTORIO
			  break;;
			  [nN]* ) echo ""
			  break;;
esac
done;;
14) echo ""
while true
do
buscar=":"
largo=`expr index $txinv $buscar`
echo "Valor  actual del  TXInvert: \33[1;33m${txinv#*=}\33[1;37m"
           	          read -p 'Valor óptimo para DVMEGA=1 : ' txinv1
                          letra=c
                         if [ $largo = 3 ]
                          then
                          linea=`expr substr $txinv 1 2`
                          else
                          linea=`expr substr $txinv 1 3`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in
			  [sS]* ) echo ""
                          sed -i "$linea TXInvert=$txinv1" $usuario/MMDVMHost/$DIRECTORIO
			  break;;
			  [nN]* ) echo ""
			  break;;
esac
done;;
15) echo ""
while true
do
buscar=":"
largo=`expr index $rx $buscar`
echo "Valor  actual  del  RXLevel : \33[1;33m${rx#*=}\33[1;37m"
           	          read -p 'Valor óptimo para DVMEGA=45 : ' var2
                          letra=c
                          if [ $largo = 3 ]
                          then
                          linea=`expr substr $rx 1 2`
                          else
                          linea=`expr substr $rx 1 3`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in
			  [sS]* ) echo ""
                          sed -i "$linea RXLevel=$var2" $usuario/MMDVMHost/$DIRECTORIO
			  break;;
			  [nN]* ) echo ""
			  break;;
esac
done;;
16) echo ""
while true
do
buscar=":"
largo=`expr index $tx $buscar`
echo "Valor  actual  del  TXLevel : \33[1;33m${tx#*=}\33[1;37m"
           	          read -p 'Valor óptimo para DVMEGA=50 : ' var2
                          letra=c
                          if [ $largo = 3 ]3
                          then
                          linea=`expr substr $tx 1 2`
                          else
                          linea=`expr substr $tx 1 3`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in
			  [sS]* ) echo ""
                          sed -i "$linea TXLevel=$var2" $usuario/MMDVMHost/$DIRECTORIO
			  break;;
			  [nN]* ) echo ""
			  break;;
esac
done;;
17) echo ""
while true
do
buscar=":"
largo=`expr index $dup $buscar`
echo "Valor actual del Duplex: \33[1;33m${dup#*=}\33[1;37m"
           	          read -p 'Para un repetidor Duplex=1 Para un DVMEGA Duplex=0: ' dup1
                          letra=c
                          if [ $largo = 3 ]
                          then
                          linea=`expr substr $dup 1 1`
                          else
                          linea=`expr substr $dup 1 1`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in
			  [sS]* ) echo ""
                          sed -i "$linea Duplex=$dup1" $usuario/MMDVMHost/$DIRECTORIO
			  break;;
			  [nN]* ) echo ""
			  break;;
esac
done;;
18) echo ""
while true
do
buscar=":"
largo=`expr index $txh $buscar`
echo "Valor actual del TXHang: \33[1;33m${txh#*=}\33[1;37m"
           	          read -p 'Para un repetidor TXHang=4 Para un DVMEGA TXHang=0: ' txh1
                          letra=c
                          if [ $largo = 3 ]
                          then
                          linea=`expr substr $txh 1 2`
                          else
                          linea=`expr substr $txh 1 3`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in
			  [sS]* ) echo ""
                          sed -i "$linea TXHang=$txh1" $usuario/MMDVMHost/$DIRECTORIO
			  break;;
			  [nN]* ) echo ""
			  break;;
esac
done;;
19) echo ""
while true
do
buscar=":"
largo=`expr index $lg $buscar`
echo "Valor actual del DisplayLevel: \33[1;33m${lg#*=}\33[1;37m"
           	     read -p 'Para visualizar tramas seguidas introduce 1, para una sola trama introduce 2:' lg1
                          letra=c
                          if [ $largo = 3 ]
                          then
                          linea=`expr substr $lg 1 2`
                          else
                          linea=`expr substr $lg 1 3`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in
			  [sS]* ) echo ""
                          sed -i "$linea DisplayLevel=$lg1" $usuario/MMDVMHost/$DIRECTORIO
			  break;;
			  [nN]* ) echo ""
			  break;;
esac
done;;
20) echo ""
while true
do
sl=`grep -n -m 1 -c '\<Slot1\>' $usuario/MMDVMHost/$DIRECTORIO`
if [ $sl = 0 ]; then
echo "no existe este comando"
else
sl=`grep -n -m 1 '\<Slot1\>' $usuario/MMDVMHost/$DIRECTORIO`
sl1=`expr substr $sl 5 30`
echo "$sl1"
fi
buscar=":"
largo=`expr index $sl $buscar`
echo "Valor actual del Slot1=: \33[1;33m${sl#*=}\33[1;37m"
           	          read -p 'Para DVMEGA Modificar el valor del Slot1=0: ' V
                          letra=c
                          if [ $largo = 3 ]
                          then
                          linea=`expr substr $sl 1 2`
                          else
                          linea=`expr substr $sl 1 3`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in                                            
			              [sS]* ) echo ""
			              V=`echo "$V" | tr -d '[[:space:]]'`			  
                          sed -i "$linea Slot1=$V" $usuario/MMDVMHost/$DIRECTORIO             
			  break;;
			  [nN]* ) echo ""
			  break;;
esac
done;;
21) echo ""
while true
do
Display=`grep -n -m 1 -c '\<Display\>' $usuario/MMDVMHost/$DIRECTORIO`
if [ $Display = 0 ]; then
echo "no existe este comando"
else
Display=`grep -n -m 1 '\<Display\>' $usuario/MMDVMHost/$DIRECTORIO`
Display1=`expr substr $Display 5 30`
#echo "$Display1"
fi
buscar=":"
largo=`expr index $Display $buscar`
echo "Valor actual del Display=: \33[1;33m${Display1#*=}\33[1;37m"
                      read -p 'Introcuce el nombre de tu Dispaly: ' V
                          letra=c
                          if [ $largo = 2 ]
                          then
                          linea=`expr substr $Display 1 1`
                          else
                          linea=`expr substr $Display 1 2`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in                                            
                    [sS]* ) echo ""
                    V=`echo "$V" | tr -d '[[:space:]]'`       
                          sed -i "$linea Display=$V" $usuario/MMDVMHost/$DIRECTORIO             
        break;;
        [nN]* ) echo ""
        break;;
esac
done;;
22) echo ""
while true
do
ScreenLayout=`grep -n -m 1 -c '\<ScreenLayout\>' $usuario/MMDVMHost/$DIRECTORIO`
if [ $ScreenLayout = 0 ]; then
echo "no existe este comando"
else
ScreenLayout=`grep -n -m 1 '\<ScreenLayout\>' $usuario/MMDVMHost/$DIRECTORIO`
ScreenLayout1=`expr substr $ScreenLayout 5 30`
#echo "$ScreenLayout1"
fi
buscar=":"
largo=`expr index $ScreenLayout $buscar`
echo "Valor actual del ScreenLayout=: \33[1;33m${ScreenLayout1#*=}\33[1;37m"
                      read -p 'Este parametro debe ser 3: ' V
                          letra=c
                          if [ $largo = 3 ]
                          then
                          linea=`expr substr $ScreenLayout 1 2`
                          else
                          linea=`expr substr $ScreenLayout 1 3`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in                                            
                    [sS]* ) echo ""
                    V=`echo "$V" | tr -d '[[:space:]]'`       
                          sed -i "$linea ScreenLayout=$V" $usuario/MMDVMHost/$DIRECTORIO             
        break;;
        [nN]* ) echo ""
        break;;
esac
done;;
23) echo ""
while true
do
Brightness=`grep -n -m 1 -c '\<Brightness\>' $usuario/MMDVMHost/$DIRECTORIO`
if [ $Brightness = 0 ]; then
echo "no existe este comando"
else
Brightness=`grep -n -m 1 '\<Brightness\>' $usuario/MMDVMHost/$DIRECTORIO`
Brightness1=`expr substr $Brightness 5 30`
#echo "$Brightness1"
fi
buscar=":"
largo=`expr index $Brightness $buscar`
echo "Valor  actual  del Brightness : \33[1;33m${Brightness1#*=}\33[1;37m"
                      read -p 'Este parametro puede ser 1 ó 2: ' V
                          letra=c
                          if [ $largo = 3 ]
                          then
                          linea=`expr substr $Brightness 1 2`
                          else
                          linea=`expr substr $Brightness 1 3`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in                                            
                    [sS]* ) echo ""
                    V=`echo "$V" | tr -d '[[:space:]]'`       
                          sed -i "$linea Brightness=$V" $usuario/MMDVMHost/$DIRECTORIO             
        break;;
        [nN]* ) echo ""
        break;;
esac
done;;
26) echo ""
while true
do
buscar=":"
largo=`expr index $modu $buscar`
echo "Valor  actual  del  Module: \33[1;33m${modu#*=}\33[1;37m"
           	          read -p 'Valor óptimo para D-STAR=B: '  modu1
                          letra=c
                         if [ $largo = 3 ]
                          then
                          linea=`expr substr $modu 1 2`
                          else
                          linea=`expr substr $modu 1 3`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""

#Convierte indicativo si se introduce en minúsculas a Mayúsculas
modu1=`echo "$modu1" | tr [:lower:] [:upper:]`

                          sed -i "$linea Module=$modu1" $usuario/MMDVMHost/$DIRECTORIO
			  break;;
			  [nN]* ) echo ""
			  break;;
esac
done;;
a) echo ""
while true
do
                          echo -n "Valor actual D-STAR \33[1;33m${presentar_valor#*=}\33[1;37m"
                          presenta_valor= sed -n $numero_linea_dstar_letrap  $usuario/MMDVMHost/$DIRECTORIO;
                          read -p 'Desactivado=0 Activado=1:  '   dmrac1
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sed -i "$numero_linea_dstar_letrac Enable=$dmrac1" $usuario/MMDVMHost/$DIRECTORIO
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
b) echo ""
while true
do
                          echo -n "Valor  actual  DMR \33[1;33m${presentar_valor#*=}\33[1;37m"
                          presenta_valor= sed -n $numero_linea_dmr_letrap  $usuario/MMDVMHost/$DIRECTORIO;
           	              read -p 'Desactivado=0 Activado=1: '   dmrac1
                          actualizar=S 
                          case $actualizar in
			                    [sS]* ) echo ""
                          sed -i "$numero_linea_dmr_letrac Enable=$dmrac1" $usuario/MMDVMHost/$DIRECTORIO
			                    break;;
			                    [nN]* ) echo ""
			                    break;;
esac
done;;
c) echo ""
while true
do
                          echo -n "Valor actual FUSION \33[1;33m${presentar_valor#*=}\33[1;37m"
                          presenta_valor= sed -n $numero_linea_fusion_letrap  $usuario/MMDVMHost/$DIRECTORIO;
                          read -p 'Desactivado=0 Activado=1:  '   dmrac1
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sed -i "$numero_linea_fusion_letrac Enable=$dmrac1" $usuario/MMDVMHost/$DIRECTORIO
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
d) echo ""
while true
do
                          echo -n "Valor  actual  P25 \33[1;33m${presentar_valor#*=}\33[1;37m"
                          presenta_valor= sed -n $numero_linea_p25_letrap  $usuario/MMDVMHost/$DIRECTORIO;
                          read -p 'Desactivado=0 Activado=1: '   dmrac1
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sed -i "$numero_linea_p25_letrac Enable=$dmrac1" $usuario/MMDVMHost/$DIRECTORIO
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
e) echo ""
while true
do
                      read -p 'Introduce el valor de la Baliza (Ej. 1-activada 0-desactivada) : ' baliza
                      actualizar=S 
                      case $actualizar in
                      [sS]* ) echo ""
                      sed -i "31c Enable=$baliza" $usuario/MMDVMHost/$DIRECTORIO
                      break;;
                      [nN]* ) echo ""
                      break;;
esac
done;;
f) echo ""
while true
do
modehang=`grep -n -m 1 -c '\<RFModeHang\>' $usuario/MMDVMHost/$DIRECTORIO`
if [ $modehang = 0 ]; then
echo "no existe este comando"
else
modehang=`grep -n -m 1 '\<RFModeHang\>' $usuario/MMDVMHost/$DIRECTORIO`
modehang1=`expr substr $modehang 5 30`
fi
buscar=":"
largo=`expr index $modehang $buscar`
echo "Valor actual del RFModeHang = : \33[1;33m${modehang1#*=}\33[1;37m"
                      read -p 'Introcuce el valor para RFModeHang (optimo=3): ' V
                          letra=c
                          if [ $largo = 2 ]
                          then
                          linea=`expr substr $modehang 1 1`
                          else
                          linea=`expr substr $modehang 1 2`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in                                            
                    [sS]* ) echo ""
                    V=`echo "$V" | tr -d '[[:space:]]'`       
                          sed -i "$linea RFModeHang=$V" $usuario/MMDVMHost/$DIRECTORIO             
        break;;
        [nN]* ) echo ""
        break;;
esac
done;;
g) echo ""
while true
do
timeo=`grep -n -m 1 -c '\<Timeout\>' $usuario/MMDVMHost/$DIRECTORIO`
if [ $timeo = 0 ]; then
echo "no existe este comando"
else
timeo=`grep -n -m 1 '\<Timeout\>' $usuario/MMDVMHost/$DIRECTORIO`
timeo1=`expr substr $timeo 5 30`
fi
buscar=":"
largo=`expr index $timeo $buscar`
echo "Valor actual del Timeout = : \33[1;33m${timeo1#*=}\33[1;37m"
                      read -p 'Introcuce el valor para Timeout (valor optimo=0): ' V
                          letra=c
                          if [ $largo = 2 ]
                          then
                          linea=`expr substr $timeo 1 1`
                          else
                          linea=`expr substr $timeo 1 2`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in                                            
                    [sS]* ) echo ""
                    V=`echo "$V" | tr -d '[[:space:]]'`       
                          sed -i "$linea Timeout=$V" $usuario/MMDVMHost/$DIRECTORIO             
        break;;
        [nN]* ) echo ""
        break;;
esac
done;;
h) echo ""
while true
do
echo "Valor del Port: \33[1;33m$MODEMNEXTION"
                          read -p 'Ejp. modem, /dev/ttyAMA0, /dev/rfcomm0, /dev/ttyUSB0 :' lat1
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sed -i "$linea_sed_MN Port=$lat1" $usuario/MMDVMHost/$DIRECTORIO
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
i) echo ""
while true
do
echo "Valor actual NXDN: \33[1;33m$NXDN"
                          read -p 'Desactivado=0 Activado=1: '   NXDN1
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sed -i "$linea_sed_NXDN Enable=$NXDN1" $usuario/MMDVMHost/$DIRECTORIO
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
j) echo ""
while true
do
                          echo "Valor actual POCSAG: \33[1;33m$POCSAG"
                          read -p 'Desactivado=0 Activado=1: '   POCSAG1
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sed -i "$linea_sed_POCSAG Enable=$POCSAG1" $usuario/MMDVMHost/$DIRECTORIO
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
24) echo ""
while true
do
buscar=":"
largo=`expr index $lat $buscar`
echo "Valor de la Latitud: \33[1;33m${lat#*=}\33[1;37m"
           	          read -p 'Introduce la Latitud ' lat1
                          letra=c
                          if [ $largo = 3 ]
                          then
                          linea=`expr substr $lat 1 2`
                          else
                          linea=`expr substr $lat 1 3`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in
			  [sS]* ) echo ""
                          sed -i "$linea Latitude=$lat1" $usuario/MMDVMHost/$DIRECTORIO
			  break;;
			  [nN]* ) echo ""
			  break;;
esac
done;;

25) echo ""
while true
do
buscar=":"
largo=`expr index $long $buscar`
echo "Valor de la Longitud: \33[1;33m${long#*=}\33[1;37m"
           	          read -p 'Introduce la Longitud ' long1
                          letra=c
                          if [ $largo = 3 ]
                          then
                          linea=`expr substr $long 1 2`
                          else
                          linea=`expr substr $long 1 3`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in
			  [sS]* ) echo ""
                          sed -i "$linea Longitude=$long1" $usuario/MMDVMHost/$DIRECTORIO
			  break;;
			  [nN]* ) echo ""
			  break;;
esac
done;;
27) echo ""
while true
do
              read -p 'Estas en DMR+ ? S/N ' actualizar     
           	 
                          
                          case $actualizar in
			  [sS]* ) echo ""
			   read -p 'Intruduce reflector DMR+ al que se conectara (ej:4370) ' opcion
                          letra1=c
                          linea4=$linea33port$letra1
                          sed -i "$linea4 Options=StartRef=$opcion;RelinkTime=10;" $usuario/MMDVMHost/$DIRECTORIO
			  break;;
			  [nN]* ) echo ""
			  letra1=c
                          linea4=$linea33port$letra1
			  sed -i "$linea4 #Options=StartRef=4370;RelinkTime=10;" $usuario/MMDVMHost/$DIRECTORIO
			  break;;
esac
done;;
28) echo ""
while true
do
                              actualizar=S 
                              case $actualizar in
			                        [sS]* ) echo ""
                              geany $usuario/MMDVMHost/$DIRECTORIO
			                        break;;
			                        [nN]* ) echo ""
			                        break;;
esac
done;;
29) echo ""
while true
do
                          echo "Valor actual Local \33[1;33m${Local#*=}\33[1;37m"
                          read -p 'Introducir el puerto: 62032  '   dmrac1
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          letrac=c
                          linea=$numero_linea$letrac
                          sed -i "$linea_sed_29 Local=$dmrac1" $usuario/MMDVMHost/$DIRECTORIO

                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
30) echo ""
while true
do
                          echo  "Valor actual del Daemon:$dae"
                          read -p 'Introducir el valor de Demon a 0  '   dmrac1
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sed -i "8c Daemon=$dmrac1" $usuario/NXDNClients/NXDNGateway/NXDNGateway.ini
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
31) echo ""
while true
do
                          echo  "Valor actual Sala $sala"
                          read -p 'Introducir el numero de la Sala  '   dmrac1
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sed -i "$linea_sed_31 Startup=$dmrac1" $usuario/NXDNClients/NXDNGateway/NXDNGateway.ini
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
32) echo ""
while true
do
                          echo  "Valor actual $Inactiv"
                          read -p 'Introduce valor 0  '   dmrac1
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sed -i "$linea_sed_32 InactivityTimeout=$dmrac1" $usuario/NXDNClients/NXDNGateway/NXDNGateway.ini
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
33) echo ""
while true
do
                          
                        
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                         
                          cd $usuario/NXDNClients/NXDNGateway/
                          rm -R private
                          mkdir private
                          cd $usuario/$SCRIPTS_version
                          cp NXDNHosts.txt $usuario/NXDNClients/NXDNGateway/private
                          cd $usuario/NXDNClients/NXDNGateway/
                          rm NXDNHosts.txt
                          wget https://raw.githubusercontent.com/g4klx/NXDNClients/master/NXDNGateway/NXDNHosts.txt
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
0) echo ""
clear
echo "\33[1;33m   **************************************************"
echo "   *                                                *"
echo "   *     CERRANDO SCRIPT                            *"
echo "   *                                                *"
echo "   **************************************************"
sleep 1
clear
exit;;	
esac
done

