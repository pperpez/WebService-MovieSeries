<?php
require 'Usuarios.php';
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    if (isset($_GET['idUsuario'])) {
        $parametro = $_GET['idUsuario'];
        $retorno = Usuarios::getListas($parametro);
        if ($retorno) {
            $datos["estado"] = 1;
            $datos["listas"] = $retorno;
            print json_encode($datos);
        } else {
            // Enviar respuesta de error general
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
