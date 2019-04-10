<?php
require_once("adodb/adodb.inc.php");
/*
	$l="root";
	$p="jb57ag2915@";

	$db = NewADOConnection('mysql');
 	$db->Connect("190.152.213.98",$l,$p,"bar") or die($db->ErrorMsg());*/
		


print "conn  ";
$hostname_cnAcademium = "local.atenas.edu.ec";
$database_cnAcademium = "academium";
$username_cnAcademium = "educacionvirtual";
$password_cnAcademium = "12345";
$cnAcademium = mysql_pconnect($hostname_cnAcademium, $username_cnAcademium, $password_cnAcademium) or print "no conecta"; //.trigger_error(mysql_error(),E_USER_ERROR);
?>