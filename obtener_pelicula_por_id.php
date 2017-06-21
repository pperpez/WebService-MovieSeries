<?php
require 'Peliculas.php';
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    if (isset($_GET['idPelicula'])) {
        $parametro = $_GET['idPelicula'];
        $retorno = Peliculas::getById($parametro);
        if ($retorno) {
            $pelicula["estado"] = 1;		
            $pelicula["pelicula"] = $retorno;
            print json_encode($pelicula);
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
