<?php 
session_start();
$port=($_POST["port"]);
$_SESSION["port"]=$port;

exec("sudo sed -i '55c txPort = $port' /opt/Analog_Bridge/FCS.ini");
exec("sudo sed -i '55c txPort = $port' /opt/Analog_Bridge/Analog_Bridge.ini");
exec("sudo sed -i '55c txPort = $port' /opt/Analog_Bridge/dmr.ini");
exec("sudo sed -i '55c txPort = $port' /opt/Analog_Bridge/dstar.ini");
exec("sudo sed -i '55c txPort = $port' /opt/Analog_Bridge/especial.ini");
exec("sudo sed -i '55c txPort = $port' /opt/Analog_Bridge/nxdn.ini");
exec("sudo sed -i '55c txPort = $port' /opt/Analog_Bridge/ysf.ini");
exec("sudo sed -i '56c rxPort = $port' /opt/Analog_Bridge/FCS.ini");
exec("sudo sed -i '56c rxPort = $port' /opt/Analog_Bridge/Analog_Bridge.ini");
exec("sudo sed -i '56c rxPort = $port' /opt/Analog_Bridge/dmr.ini");
exec("sudo sed -i '56c rxPort = $port' /opt/Analog_Bridge/dstar.ini");
exec("sudo sed -i '56c rxPort = $port' /opt/Analog_Bridge/especial.ini");
exec("sudo sed -i '56c rxPort = $port' /opt/Analog_Bridge/nxdn.ini");
exec("sudo sed -i '56c rxPort = $port' /opt/Analog_Bridge/ysf.ini");

header("Location: panel_configuracion.php");	
//esto es el cambio
?>