
<?php
require 'Peliculas.php';
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    $peliculas = Peliculas::getSeries();
    if ($peliculas) {
        $datos["estado"] = 1;
        $datos["peliculas"] = $peliculas;
        print json_encode($datos);
    } else {
        print json_encode(array(
            "estado" => 2,
            "mensaje" => "Ha ocurrido un error"
        ));
    }
}
?>
