<?php 
session_start();
//Pasar a DMR+

exec("sudo systemctl stop ysfgateway.service");
exec("sudo systemctl stop dmr2ysf.service");

exec("sudo cp /opt/MMDVM_Bridge/dmrplus.ini /opt/MMDVM_Bridge/MMDVM_Bridge.ini");
exec("sudo cp /opt/Analog_Bridge/dmr.ini /opt/Analog_Bridge/Analog_Bridge.ini");

$options=($_POST["options"]);

exec("sudo sed -i '78c $options' /opt/MMDVM_Bridge/dmrplus.ini");
exec("sudo cp /opt/MMDVM_Bridge/dmrplus.ini /opt/MMDVM_Bridge/MMDVM_Bridge.ini");

exec("sudo systemctl restart analog_bridge.service");
exec("sudo systemctl restart ircddbgateway.service");
exec("sudo systemctl restart md380-emu.service");
exec("sudo systemctl restart mmdvm_bridge.service");
exec("sudo systemctl restart nxdngateway.service");
	
?>
<!DOCTYPE html>
<html>
<head>
     <meta charset="UTF-8"> 
     <meta http-equiv="content-type" content="text/html">
     <meta name="author" content="EA3EIZ">
     <link rel="shortcut icon" href="imagenes/favicon.png" type="image/x-icon" />
     <title>cambiando</title>
     <meta http-equiv="refresh" content="0; url=sistema_plus.php" />
     <link rel="stylesheet"href="css/bootstrap.min.css" >
     <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<style>
    body{
    background:#333;
    }
    .texto_centrado_blanco{
    padding-top: 60px;
    color: #FFFFFF;
    font-size: 30px;
    text-align: center;
    }
    .config_especial{
    height: 200px;
    background:#8000FF;
    border-radius: 8px 8px 8px 8px;
    }    
</style>

</head>
<body>
 <div class="container"> 
 	<br><br>
        <div class="row">
               <div class="col-md-6 col-md-offset-2 config_especial">    
                	<h1 class="texto_centrado_blanco">CAMBIANDO A DMR+</h1>
               </div> 	                       
        </div><!--  row -->
</div><!--container-->

<!-- JavaScript================================================== -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
