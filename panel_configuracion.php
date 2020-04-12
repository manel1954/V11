<?php 
session_start();

$OPTION = exec("sed -n '78p' /opt/MMDVM_Bridge/MMDVM_Bridge.ini");
$OPTION1 = substr("$OPTION", 17, 4);

$IPCS22 = exec("sed -n '70p' /opt/MMDVM_Bridge/MMDVM_Bridge.ini");

$ambe_activo = exec("sed -n '23p'  /opt/Analog_Bridge/Analog_Bridge.ini");
$ambe_activo = substr("$ambe_activo", 18, 4);

$ip_ambe = exec("sed -n '92p'  /opt/Analog_Bridge/Analog_Bridge.ini");
$ip_ambe = substr("$ip_ambe", 10, 16);

$puerto_ambe = exec("sed -n '93p'  /opt/Analog_Bridge/Analog_Bridge.ini");
$puerto_ambe = substr("$puerto_ambe", 9, 10);

$dmr = exec("sed -n '78p' /opt/MMDVM_Bridge/MMDVM_Bridge.ini");
$dmr = substr("$dmr", 0, 1);

if ($dmr=="O")
{
    $dmr="DMR+";

//=======================================
if ($IPCS22=="Address=217.61.2.11"){
    $IPCS22="Catalunya";
}

if ($IPCS22=="Address=212.237.3.141"){
    $IPCS22="EA-Hotspot";
}

if ($IPCS22=="Address=94.177.189.17"){
    $IPCS22="EA-RPTR";
}

if ($IPCS22=="Address=217.61.97.204"){
    $IPCS22="EA1Master";
}
if ($IPCS22=="Address=185.47.129.230"){
    $IPCS22="EA2Master";
}
if ($IPCS22=="Address=212.237.4.86"){
    $IPCS22="EA3-RPTR";
}
if ($IPCS22=="Address=89.36.222.146"){
    $IPCS22="EA3Master";
}
if ($IPCS22=="Address=80.211.226.37"){
    $IPCS22="EA4Master";
}
if ($IPCS22=="Address=217.61.98.58"){
    $IPCS22="EA5Master";
}
if ($IPCS22=="Address=212.237.50.28"){
    $IPCS22="EA7Master";
}
if ($OPTION1=="4000"){
    $OPTION = substr("$OPTION", 42, 5);
}
//==========================================
else {
    $OPTION = substr("$OPTION", 17, 4);
    //$IPCS22="";
}

}
else {
    $dmr="BRANDMEISTER";
    $OPTION="";
    $IPCS22="";
}

$sistema = exec("sed -n '1p'  /opt/Analog_Bridge/Analog_Bridge.ini");
$sistema = substr("$sistema", 2, 3);

if ($sistema=="FCS")
{
    $sistema="FCS";
    $OPTION="";
    $sala_fcs = exec("sed -n '42p' /home/pi/YSFClients/YSFGateway/YSFGateway.ini");
    $sala_fcs = substr("$sala_fcs", 11, 5);  
    $IPCS22=$sala_fcs;
}
if ($sistema=="esp")
{
    $sistema="ESPECIAL";
}

if ($sistema=="dmr")
{
    $sistema=$dmr;
}
elseif ($sistema=="dst")
{
    $sistema="D-STAR";
    $OPTION="";
    $reflector_dstar = exec("sed -n '18p' /etc/ircddbgateway");
    $reflector_dstar = substr("$reflector_dstar", 11, 8);
    $IPCS22=$reflector_dstar;
}
elseif ($sistema=="nxd")
{
    $sistema="NXDN";
    $OPTION="";
    $sala_nxdn = exec("sed -n '10p' /opt/NXDNClients/NXDNGateway/private/NXDNHosts.txt");
    $sala_nxdn = substr("$sala_nxdn", 0, 5);
    $IPCS22=$sala_nxdn;
}
elseif ($sistema=="ysf")
{
    $sistema="YSF";
    $OPTION="";
    $IPCS22="";
}

$version_dvswitch = exec("sed -n '11p'  /home/pi/info.ini");
$id = exec("sed -n '38p'  /opt/Analog_Bridge/Analog_Bridge.ini");
$id = substr("$id", 15, 9);

$id2 = exec("sed -n '3p'  /opt/MMDVM_Bridge/MMDVM_Bridge.ini");
$id2 = substr("$id2", 3, 9);

$indicativo = exec("sed -n '2p' /opt/MMDVM_Bridge/MMDVM_Bridge.ini");
$indicativo = substr("$indicativo", 9, 7);

$port = exec("sed -n '55p'  /opt/Analog_Bridge/Analog_Bridge.ini");
$port = substr("$port", 9, 5);

$location = exec("sed -n '14p' /opt/MMDVM_Bridge/MMDVM_Bridge.ini");
$location = substr("$location", 9, 30);

$url = exec("sed -n '16p' /opt/MMDVM_Bridge/MMDVM_Bridge.ini");
$url = substr("$url", 4, 30);

$Latitude = exec("sed -n '11p' /opt/MMDVM_Bridge/MMDVM_Bridge.ini");
$Latitude = substr("$Latitude", 9, 9);

$Longitude = exec("sed -n '12p' /opt/MMDVM_Bridge/MMDVM_Bridge.ini");
$Longitude = substr("$Longitude", 10, 9);

$reflector_dstar = exec("sed -n '18p' /etc/ircddbgateway");
$reflector_dstar = substr("$reflector_dstar", 11, 8);

$address_especial    = exec("sed -n '70p'  /opt/MMDVM_Bridge/especial.ini");
$address_especial    = substr("$address_especial   ", 8, 30);

$port_especial = exec("sed -n '71p'  /opt/MMDVM_Bridge/especial.ini");
$port_especial = substr("$port_especial", 5, 5);

$password_especial = exec("sed -n '74p' /opt/MMDVM_Bridge/especial.ini");
$password_especial = substr("$password_especial", 9, 15);

$sala_nxdn = exec("sed -n '10p' /opt/NXDNClients/NXDNGateway/private/NXDNHosts.txt");
$sala_nxdn = substr("$sala_nxdn", 0, 5);

$selfcare = exec("sed -n '74p' /opt/MMDVM_Bridge/brandmeister_esp.ini");
$selfcare = substr("$selfcare", 9, 20);

$sala_fcs = exec("sed -n '42p' /home/pi/YSFClients/YSFGateway/YSFGateway.ini");
$sala_fcs = substr("$sala_fcs", 11, 5);

//COMPROBAMOS SI EL DVSWITCH ESTÁ ACTIVADO EN EL ESCRITORIO DE LA IMAGEN V10
$dvswitch = exec("sed -n '18p' /home/pi/.local");
if ($dvswitch=="DVSWITCH=ON"){
?>
<!-- ============================================== -->

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="Dvswitch Mobile">
    <meta name="description" content="Dvswitch Mobile">
    <meta name="author" content="EA3EIZ">

<!-- refresca la página cada 10 segundo (implantado por mi) -->
<!-- ====================================================== -->
<!-- <meta http-equiv="refresh" content="5" /> -->

<link rel="shortcut icon" href="img/BOLA_MUNDO_ADER.png">
    <title>DV_ADER</title>
    <!-- CSS Bootstrap-->
    <link href="custom/bootstrap/css/bootstrap.css" rel="stylesheet">
    
    <!-- CSS tema -->
    <link href="css/freelancer.css" rel="stylesheet">
    
    <!-- <Fuentes -->
    <link href="custom/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

<style type="text/css">
body{
    background-image: url(../img/fondo_02.png);
    }
.sistema{
    height: 50px;
    color:#FFFFFF;
    font-size: 25px;
    padding-top: 5px;
    text-align: center;
    background:#108040;
    border-radius: 4px 4px 4px 4px;
    }
header {
    text-align: center;
    height:auto;
    background-image: url(../img/fondo_02.png);
    color: white;
    background: no-repeat;
}
.color_rojo{
    color: #FC0107;
    font-size: 22px;
    background: #000000;
    }
.color_verde{
    color:#21FF06;
    font-size: 22px;
    background: #000000;
    }
.version{
    height: 50px;
    color:#FFFFFF;
    font-size: 20px;
    padding-top: 8px;
    text-align: center;
    background:#000000;
    border-radius: 4px 4px 4px 4px;
    }    
.callsign{
    height: 50px;
    color:#FFFFFF;
    font-size: 22px;
    padding-top: 10px;
    text-align: center;
    background:#FD8008;
    border-radius: 4px 4px 4px 4px;
    } 
.ipcs2{
    color:#000000;
    font-size: 25px;
    padding-top: 11px;
    } 
@media (max-width: 360px) {
.ipcs2{
    color:#000000;
    font-size: 18px;
    padding-top: 11px;
    }
    .sistema{
    height: 50px;
    color:#FFFFFF;
    font-size: 18px;
    padding-top: 5px;
    text-align: center;
    background:#108040;
    border-radius: 4px 4px 4px 4px;
    } 
}
@media (min-width: 375px) {
.ipcs2{
    color:#000000;
    font-size: 18px;
    padding-top: 11px;
    }
    .sistema{
    height: 50px;
    color:#FFFFFF;
    font-size: 18px;
    padding-top: 5px;
    text-align: center;
    background:#108040;
    border-radius: 4px 4px 4px 4px;
    } 
}
@media (min-width: 760px) {
.ipcs2{
    color:#000000;
    font-size: 25px;
    padding-top: 11px;
    }
    .sistema{
    height: 50px;
    color:#FFFFFF;
    font-size: 25px;
    padding-top: 5px;
    text-align: center;
    background:#108040;
    border-radius: 4px 4px 4px 4px;
    } 
}
.ambe{
    height: 440px;
    color:#FFFFFF;
    font-size: 26px;
    padding-top: 5px;
    text-align: center;
    background:#800080;
    border-radius: 4px 4px 4px 4px;
    }
.ambe_desactivado{
    margin-top: 1px;
    margin-bottom: 7px;
    width: 100%;
    height: 41px;
    text-align:center;
    padding: 0px 0px 0px 0px;
    background-color: #000000;
    border-radius: 5px 5px 5px 5px;
    font-size: 24px;
    color:#F00000;
    border: 1px solid #ccc;
}
.ambe_activado{
    margin-top: 1px;
    margin-bottom: 7px;
    width: 100%;
    height: 41px;
    text-align:center;
    padding: 0px 0px 0px 0px;
    background-color: #108040;
    border-radius: 5px 5px 5px 5px;
    font-size: 24px;
    color:#FFFFFF;
    border: 1px solid #ccc;
}       
.color_naranja{
    color:#21FF06;
    }    
.fuente_boton{
    font-size:16px;
    color:#FFFFFF;
    }
.fuente_boton1{
    font-size:18px;
    color:#f00000;
    }
.fuente_boton2{
    font-size:14px;
    color:#FFFFFF;
    }
.fuente_boton3{
    font-size:15px;
    color:#f00000;
    }
.config{
    background:#000000;
    border-radius: 8px 8px 8px 8px;
    }
.config_especial{
    height: 440px;
    background:#091398;
    border-radius: 8px 8px 8px 8px;
    }
h4{
    text-align:center;
    color:#FFFFFF;
    font-size:24px;
} 
h5{
    text-align:center;
    color:#FFFFFF;
    font-size:18px;
   text-transform: none;
} 
h6{
    text-align:center;
    color:#FFFFFF;
    font-size:14px;
}  
.fondo_datos{
    margin-top: 1px;
    margin-bottom: 7px;
    width: 100%;
    height: 25px;
    text-align:center;
    padding: 0px 0px 0px 0px;
    background-color: #4C4C4C;
    border-radius: 5px 5px 5px 5px;
    font-size: 16px;
    color:#FFFFFF;
    border: 1px solid #ccc;
}
.form-control {
    height: 25px;
    text-align: center;
    font-size: 16px;
}
</style>
</head>
<body>

    <!-- Navigation -->
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                    <a href="http://associacioader.com" class="img-responsive"><img src="img/Logo_Ader.png" width="150" alt=""></a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">

<li class="dropdown">
    <a href="##" class="dropdown-toggle" data-toggle="dropdown">Cambiar de sistema<b class="caret"></b></a>
    <ul class="dropdown-menu">
    <li><a href="sistema_plus.php">DMR+</a></li>
    <li class="divider"></li>
    <li><a href="brandmeister.php">BRANDMEISTER</a></li>
    <li class="divider"></li>
    <li><a href="dstar.php">D-STAR</a></li>
    <li class="divider"></li>
    <li><a href="ysf.php">YSF</a></li>
    <li class="divider"></li>
    <li><a href="nxdn.php">NXDN</a></li>
    <li class="divider"></li>
    <li><a href="FCS.php">FCS</a></li>
    <li class="divider"></li>
    <li><a href="especial.php">CONFIGURACIÓN ESPECIAL</a></li>
    </ul>
</li>
        <li><a href="borra_logs.php">BORRAR LOGS</a></li>
              </ul>
            </div>
        </div>
    </nav>

<div class="container"> 
<br><br><br><br><br><br>
<!--============== CAJA LOGIN ====================================--> 

 <div class="row">

    <div class="col-md-4 version">
<span>Dvswitch IMAGEN ADER V-<?php echo $version_dvswitch;?></span>       
<!--  <span>Dvswitch IMAGEN ADER V-6.0.1</span>-->    
</div>

    <div class="col-md-6 sistema">
        <span>Sistema actual: <?php echo $sistema;?> </span><span class="ipcs2"><?php echo $IPCS22;?> <?php echo $OPTION;?></span>
    </div>

    <div class="col-md-2 callsign">
        <span>V11&nbsp;<?php echo $indicativo;?></span>
    </div>

</div>

 
<br>


<div class="row">
    <div class="col-md-4 config">
       
          
    <!-- <p><img src="img/Logo_Ader.png" height="40"></p> -->
     <h5>CONFIGURACIÓN GENERAL</h5>
    
<form method="post" action="cambia_selfcare.php"/>      
        <input name="selfcare" class="form-control fuente_boton1" placeholder="Introduce pass Selfcare Brandmeister + enter">
            <div class="fondo_datos">Password: 
                <span class="color_naranja"><?php echo $selfcare;?></span>
            </div>      

</form>

<form method="post" action="cambia_configuracion_indicativo.php"/>

        <input name="indicativo" class="form-control fuente_boton1" placeholder="Introduce indicativo + enter">
            <div class="fondo_datos">Indicativo: 
                <span class="color_naranja"><?php echo $indicativo;?></span>
            </div>       
</form>

<form method="post" action="cambia_configuracion_id.php"/>                
        <input name="id" class="fuente_boton1 form-control" placeholder="Introduce Id 7 dígitos + enter">                  
            <div class="fondo_datos">In Simple: 
                <span class="color_naranja"><?php echo $id;?></span>
            </div>
</form>

<form method="post" action="cambia_configuracion_id2.php"/>
   
        <input name="id2" class="fuente_boton1 form-control" placeholder="Introduce Id 9 dígitos + enter">
            <div class="fondo_datos">Id 9 dígitos:
                <span class="color_naranja"><?php echo $id2;?></span>
            </div> 
</form>

<form method="post" action="cambia_reflector_dstar.php"/>
        <input name="reflector_dstar" class="fuente_boton1 form-control" placeholder="Introduce reflector ej.XRF266 Y + enter"> 
            <div class="fondo_datos">Reflector D-STAR:
                <span class="color_naranja"><?php echo $reflector_dstar;?></span>
            </div>
</form>

<form method="post" action="cambia_configuracion_port.php"/>
        <input name="port" class="fuente_boton1 form-control" placeholder="Introduce puerto 50300 + Enter">
            <div class="fondo_datos">Puerto Dvswitch: 
                <span class="color_naranja"><?php echo $port;?></span>
            </div>
</form>

<form method="post" action="cambia_configuracion_latitud.php"/>
        <input name="Latitude" class="fuente_boton1 form-control" placeholder="Introduce Latitud + Enter">
            <div class="fondo_datos">Latitud: 
                <span class="color_naranja"><?php echo $Latitude;?></span>
            </div>
</form>

<form method="post" action="cambia_configuracion_longitud.php"/>   
        <input name="Longitude" class="fuente_boton1 form-control" placeholder="Introduce Longitud + Enter"> 
            <div class="fondo_datos">Longitud: 
                <span class="color_naranja"><?php echo $Longitude;?></span>
            </div>               
</form>

<form method="post" action="cambia_configuracion_location.php"/>    
        <input name="location" class="fuente_boton1 form-control" placeholder="Introduce tu Ciudad + Enter"> 
            <div class="fondo_datos">Ciudad: 
                <span class="color_naranja"><?php echo $location;?></span>
            </div>   
</form>

<form method="post" action="cambia_configuracion_url.php"/>   
        <input name="url" class="fuente_boton1 form-control" placeholder="Introduce tu Web preferida + Enter"> 
            <div class="fondo_datos">Mi Web: 
                <span class="color_naranja"><?php echo $url;?></span>
            </div> 
</form>

<form method="post" action="restart_services.php"/>
    <button class="btn btn-warning btn-sm btn-block" type="submit">APLICAR LOS CAMBIOS E INICIAR SISTEMAS</button>
</form>
<br>   
   </div><!-- "col-md-4 -->


<!--============== FIN CAJA LOGIN ====================== -->

<!--============== CAJA LOGIN ====================================-->

<div class="col-md-4 ambe">

    <h5>CONFIGURACIÓN AMBE SERVER</h5>

<?php
    if ($ambe_activo=="true"){
?>
        <div class="ambe_desactivado">
            <span>Ambe server desactivado</span>
        </div>
<?php
}
    else {
?>
        <div class="ambe_activado">
            <span>Ambe server activado</span>
        </div>
<?php
}
?>

<form method="post" action="cambia_ip_ambe.php"/><br>
        <input name="ip_ambe" class="fuente_boton3 form-control" placeholder="Introduce IP + Enter">
            <div class="fondo_datos">IP: 
                <span class="color_naranja"><?php echo $ip_ambe;?></span>
            </div>         
</form>
<br>
<form method="post" action="cambia_puerto_ambe.php"/>
        <input name="puerto_ambe" class="fuente_boton3 form-control" placeholder="Introduce Puerto Router + Enter">
            <div class="fondo_datos">Puerto Router: 
                <span class="color_naranja"><?php echo $puerto_ambe;?></span>
            </div>         
</form>

<form method="post" action="cambia_activa_ambe.php"/>
    <button class="btn btn-success btn-sm btn-block" type="submit">ACTIVAR AMBE SERVER</button>
</form>

<br>

<form method="post" action="cambia_desactiva_ambe.php"/>
    <button class="btn btn-danger btn-sm btn-block" type="submit">DESACTIVAR AMBE SERVER</button>
</form>
<br>
</div>
<!--============== CAJA LOGIN ====================================-->      
 
    <div class="col-md-4 config_especial">     
        <h5>CONFIGURACIÓN ESPECIAL</h5>
     <h6>Brandmeister otro País, xlx, HBlink, etc..</h6>
<form method="post" action="cambia_address_especial.php"/>

        <input name="address_especial" class="fuente_boton3 form-control" placeholder="Introduce Address + Enter">
            <div class="fondo_datos">Address especial: 
                <span class="color_naranja"><?php echo $address_especial;?></span>
            </div>         

</form>

<form method="post" action="cambia_puerto_especial.php"/>

        <input name="port_especial" class="fuente_boton3 form-control" placeholder="Introduce Port + Enter">
            <div class="fondo_datos">Puerto Especial: 
                <span class="color_naranja"><?php echo $port_especial;?></span>
            </div>         

</form>

<form method="post" action="cambia_password_especial.php"/>

        <input name="password_especial" class="fuente_boton3 form-control" placeholder="Introduce Password + Enter"> 
            <div class="fondo_datos">Password especial: 
                <span class="color_naranja"><?php echo $password_especial;?></span>
            </div> 

</form>

<form method="post" action="cambia_sala_nxdn.php"/>

        <input name="sala_nxdn" class="fuente_boton3 form-control" placeholder="Sala NXDN ej.21465 80.211.106.186 41400 + Enter">    
            <div class="fondo_datos">Sala NXDX: 
                <span class="color_naranja"><?php echo $sala_nxdn;?></span>
            </div> 

</form>

<form method="post" action="cambia_sala_FCS.php"/>

        <input name="sala_fcs" class="fuente_boton3 form-control" placeholder="Sala FCS ej.FCS00465 + Enter">    
            <div class="fondo_datos">Sala FCS: 
                <span class="color_naranja"><?php echo $sala_fcs;?></span>
            </div> 

</form>
<br>
<form method="post" action="restart_services.php"/>
    <button class="btn btn-warning btn-sm btn-block" type="submit">APLICAR LOS CAMBIOS E INICIAR SISTEMAS</button>
</form>
<br>

   </div><!-- "col-md-4 -->



            <div class="col-md-4 text-center thumbnail"><br>
                <img src="img/PANEL_CONTROL.png" width="195" ></img><br>
                <a href="../panel_control/panel_control.php" class="btn btn-success btn-sm">PANEL DE CONTROL</a>
            </div>



</div><!-- row -->

<!--============== FIN CAJA LOGIN ====================== -->

</div><!-- container -->

    <header>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-text">
                                            </div>
                </div>
            </div>
        </div>
<!-- FOOTER ==================================== -->

      <footer>
        <p class="color_naranja_izquierd">&copy; DVSWITCH MOBILE ADER 2019&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Design by:&nbsp;&nbsp;( EA3EIZ )</p>
      </footer>
<!-- FIN  DEL FOOTER ==================================== -->
    </header>
    

    <?php
    //EL DVSWITCH NO ESTÁ ACTIVADO Y NO ABRE LA PAGINA DEL DVSWITCH
}else {
header('Location: dvswitch_desactivado.php');    
}
?>
    <!-- jQuery -->
    <script src="custom/jquery/jquery.min.js"></script>
    <script src="custom/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>
    <script src="js/freelancer.min.js"></script>
<script>
function parpadear() {
with (document.getElementById("parpadeo").style)
visibility = (visibility == "visible") ? "hidden" : "visible";
}
</script>


<script>
function esconde_div(){
   var elemento = document.getElementById("activado");
   elemento.style.display = 'none';
}
 
function visible_div(){
   var elemento = document.getElementById("activado");
   elemento.style.display = 'block';
}
</script>

</body>
</html>
