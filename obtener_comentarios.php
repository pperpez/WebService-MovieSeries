<?php
require 'Peliculas.php';
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    if (isset($_GET['idPelicula'])) {
        $parametro = $_GET['idPelicula'];
	$comentarios = Peliculas::getComentarios($parametro);
	if ($comentarios) {
			$datos["estado"] = 1;
			$datos["comentarios"] = $comentarios;
        print json_encode($datos);
		} else {
			print json_encode(array(
				"estado" => 2,
				"mensaje" => "Ha ocurrido un error"
			));
		}
	} else {
       print json_encode(
            array(
                'estado' => '3',
                'mensaje' => 'Se necesita un identificador'
            )
        );
    }
}
?>
