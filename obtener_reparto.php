<?php
require 'Peliculas.php';
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    if (isset($_GET['idPelicula'])) {
        $idPelicula = $_GET['idPelicula'];
        $reparto = Peliculas::getReparto($idPelicula);
                if ($reparto) {
                        $datos["estado"] = 1;
                        $datos["reparto"] = $reparto;
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

