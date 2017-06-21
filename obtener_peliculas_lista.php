<?php
require 'Peliculas.php';
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    if (isset($_GET['idLista'])) {
        $parametro = $_GET['idLista'];
        $retorno = Peliculas::getPeliculasLista($parametro);
        if ($retorno) {
            $datos["estado"] = 1;
            $datos["peliculas"] = $retorno;
            print json_encode($datos);
        } else {
            print json_encode(
                array(
                    'estado' => '2',
                    'mensaje' => 'Ocurrio un error en la consulta'
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

