<?php
require 'Peliculas.php';
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    if (isset($_GET['idPelicula']) && isset($_GET['idUsuario'])) {
        $idPelicula = $_GET['idPelicula'];
        $idUsuario = $_GET['idUsuario'];
        $retorno = peliculas::getValoracionUsuario($idPelicula, $idUsuario);
        if ($retorno) {
            $datos["estado"] = 1;
            $datos["valoracion"] = $retorno;
            print json_encode($datos);
        } else {
            print json_encode(
                array(
                    'estado' => '2',
                    'mensaje' => 'No se obtuvo el registro'
                )
            );
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
