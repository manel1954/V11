#!/bin/bash
mode=`grep -n -m 1 "^Port=" /home/pi/MMDVMHost/MMDVMBM.ini`
buscar=":"
caracteres=`expr index $mode $buscar`
caracteres_linea=`expr $caracteres - 1`
numero_linea_port=`expr substr $mode 1 $caracteres_linea`
mode=$(awk "NR==$numero_linea_port" /home/pi/MMDVMHost/MMDVMBM.ini)
puerto=`expr substr $mode 11 9`
puerto="  "$puerto

frecuencia=$(awk "NR==13" /home/pi/MMDVMHost/MMDVMBM.ini)
frecuencia=`expr substr $frecuencia 13 17`
frecuencia=$frecuencia

address=`grep -n -m 1 "^Address=" /home/pi/MMDVMHost/MMDVMBM.ini`
buscar=":"
caracteres=`expr index $address $buscar`
caracteres_linea=`expr $caracteres - 1`
numero_linea_address=`expr substr $address 1 $caracteres_linea`
mode=$(awk "NR==$numero_linea_address" /home/pi/MMDVMHost/MMDVMBM.ini)
address=`expr substr $address 13 30`
address="  "$address

#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"
#figlet $puerto
echo "${BLANCO}"
echo "       INFORMACIÓN MMDVM1 (BM)"
echo "${VERDE}"
echo "  *************************************"
echo ""
echo "${CIAN}  Frecuencia: ${AMARILLO}$frecuencia   "
echo "${CIAN}  Puerto:   ${AMARILLO}$puerto   "
echo "${CIAN}  Servidor: ${AMARILLO}$address   "
echo "${VERDE}"
echo "  *************************************"
echo "${ROJO}"

echo -n "  Se cerrará en 5."
sleep 1
echo -n "4."
sleep 1
echo -n "3."
sleep 1
echo -n "2."
sleep 1
echo -n "1."
sleep 1
echo -n "0"
sleep 1
read a