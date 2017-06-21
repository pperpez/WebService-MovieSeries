<?php

require 'Usuarios.php';
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $body = json_decode(file_get_contents("php://input"), true);
    $retorno = Usuarios::insert(
        $body['nombreLogin'],
        $body['password'],
        $body['email']);
    if ($retorno != -1) {
        $json_string = json_encode(array("estado" => 1,"mensaje" => "Creacion correcta", "idUsuario" => $retorno));
		echo $json_string;
    } else {
        $json_string = json_encode(array("estado" => 2,"mensaje" => "No se creo el registro"));
		echo $json_string;
    }
}
?>
