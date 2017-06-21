<?php

require 'Usuarios.php';
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $body = json_decode(file_get_contents("php://input"), true);
    $retorno = Usuarios::checkLogin(
        $body['nombreLogin'],
        $body['password']);
    if ($retorno) {
        $json_string = json_encode(array("estado" => 1, "usuario" => $retorno));
		echo $json_string;
    } else {
        $json_string = json_encode(array("estado" => 2,"mensaje" => "Login incorrecto"));
		echo $json_string;
    }
}
?>
