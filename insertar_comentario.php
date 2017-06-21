<?php

require 'Peliculas.php';
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $body = json_decode(file_get_contents("php://input"), true);
    $retorno = Peliculas::insertComentario(
        $body['idPelicula'],
        $body['idUsuario'],
        $body['comentario']);
    if ($retorno) {
        $json_string = json_encode(array("estado" => 1,"mensaje" => "Comentario insertado"));
                echo $json_string;
    } else {
        $json_string = json_encode(array("estado" => 2,"mensaje" => "No se creo el comentario"));
                echo $json_string;
    }
} 
?>
