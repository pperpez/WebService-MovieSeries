<?php
require 'Peliculas.php';
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $body = json_decode(file_get_contents("php://input"), true);
    $retorno = Peliculas::deletePeliculaLista($body['idLista'], $body['idPelicula']);
    if ($retorno) {
        $json_string = json_encode(array("estado" => 1,"mensaje" => "Eliminacion exitosa"));
		echo $json_string;
    } else {
        $json_string = json_encode(array("estado" => 2,"mensaje" => "No se elimino el registro"));
		echo $json_string;
    }
}
?>
