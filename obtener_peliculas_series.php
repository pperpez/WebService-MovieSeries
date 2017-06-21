<?php
require 'Peliculas.php';
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
	$retorno = Peliculas::getPeliculasSeries();
	if ($retorno) {
		$datos["estado"] = 1;
		$datos["peliculas"] = $retorno;
		print json_encode($datos);
	} else {
		// Enviar respuesta de error general
		print json_encode(
			array(
				'estado' => '2',
				'mensaje' => 'No se obtuvo el registro'
			)
		);
	}
}
?>
