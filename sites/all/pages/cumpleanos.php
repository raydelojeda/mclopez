<?php require_once('cnAcademium.php'); ?>
<?php 
	function cambiarCaracteres($texto) {
		return htmlentities($texto);
	}
print "llegaaaa";
	

mysql_select_db($database_cnAcademium, $cnAcademium);
	$query_rsCumpleanos = "SELECT CONCAT('<img class=\"atenas-no-border\" src=http://academico.atenas.edu.ec/academium/fotos/',foto_epl,' width=\"37px\" height=\"48px\">') AS foto,CONCAT(apellido_epl,' ',nombre_epl) AS nombre,fechaNacimiento_epl 
FROM empleado e 
WHERE prospecto_epl='NO' AND estadoEmpleado_epl = 'ACTIVO' AND MONTH(CURDATE()) = MONTH(fechaNacimiento_epl) 
ORDER BY DAY(fechaNacimiento_epl), apellido_epl, nombre_epl";

	$rsCumpleanos = mysql_query($query_rsCumpleanos, $cnAcademium) or die(mysql_error()); 
?>
  <table border="1" align="center" width="100% bordercolor="#000000" style="border-collapse:separate;">
    <tr>
      <th colspan="3" style="text-align: center;" class="atenas">
        <img src="/intranet/images/torta.png" class="atenas-no-border" alt="Feliz Cumpleaños" />
      </th>
    </tr>
	<tr>   </tr>
	<tr> 
		<td>
			<b>FOTO</b>
		</td>
		<td>
			<b>NOMBRE</b>
		</td>
		<td>	
			<b>FECHA</b>
		</td>
	</tr>
<?php 
	setlocale(LC_TIME, "esp");
	$i = 0;
	while ($row_rsCumpleanos = mysql_fetch_assoc($rsCumpleanos)) {
		$i++; ?>
    <tr>    
      <td class="<?php echo $i % 2 != 0 ? "atenas-odd" : "atenas-even"; ?>"><?php echo $row_rsCumpleanos['foto']; ?></td>
      <td class="<?php echo $i % 2 != 0 ? "atenas-odd" : "atenas-even"; ?>"><?php echo cambiarCaracteres($row_rsCumpleanos['nombre']); ?></td>
      <td class="<?php echo $i % 2 != 0 ? "atenas-odd" : "atenas-even"; ?>" style="text-align: right" nowrap="nowrap"><?php echo ucfirst(strftime("%b/%d", strtotime($row_rsCumpleanos['fechaNacimiento_epl']))); ?></td>		
    </tr>      
<?php } ?>
  </table>
<?php
	mysql_free_result($rsCumpleanos);
?>
