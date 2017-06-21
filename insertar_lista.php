<?php
require 'Usuarios.php';
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $body = json_decode(file_get_contents("php://input"), true);
    $retorno = Usuarios::insertLista(
        $body['idUsuario'],
        $body['nombre']);
    if ($retorno) {
        $json_string = json_encode(array("estado" => 1,"mensaje" => "Lista insertada"));
		echo $json_string;
    } else {
        $json_string = json_encode(array("estado" => 2,"mensaje" => "No se creo el registro"));
		echo $json_string;
    }
}
?>
