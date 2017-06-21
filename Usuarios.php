<?php

require 'Database.php';
class Usuarios
{
    function __construct()
    {
    }
	
    public static function checkLogin($nombreLogin, $password)
    {
       $consulta = "SELECT *
                             FROM usuarios
                             WHERE NombreLogin = ? and Password = ?";
        try {
            $comando = Database::getInstance()->getDb()->prepare($consulta);
            $comando->execute(array($nombreLogin, $password));
            $row = $comando->fetch(PDO::FETCH_ASSOC);
            return $row;
        } catch (PDOException $e) {
            return -1;
        }
    }
    public static function insert(
        $nombreLogin,
        $password,
	$email
    )
    {
        try{
        $comando = "INSERT INTO usuarios ( " .
            "NombreLogin," .
            "Password," .
            " Email)" .
            " VALUES( ?,?,?)";
        $sentencia = Database::getInstance()->getDb()->prepare($comando);
        $sentencia->execute(
            array(
                $nombreLogin,
                $password,
		$email
            )
        );
	$cmd = Database::getInstance()->getDb()->prepare("SELECT idUsuario FROM usuarios WHERE NombreLogin = ?");
        $cmd->execute(array($nombreLogin));
        $row = $cmd->fetch(PDO::FETCH_ASSOC);
        return $row;
        } catch (PDOException $e) {
            return -1;
        }
    }

    public static function getListas($idUsuario)
    {
        $consulta = "SELECT * from listas WHERE idUsuario = ?";
        try {
            $comando = Database::getInstance()->getDb()->prepare($consulta);
            $comando->execute(array($idUsuario));
			return $comando->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            return false;
        }
    }

    public static function insertLista(
        $idUsuario,
        $nombre
    )
    {
        try{
        $comando = "INSERT INTO listas ( " .
                "Nombre," .
                " idUsuario)" .
                " VALUES( ?,?)";
        $sentencia = Database::getInstance()->getDb()->prepare($comando);
        return $sentencia->execute(
                array(
                        $nombre,
                        $idUsuario
                )
        );
        }catch (PDOException $e) {
           return false;
        }
    }
}
?>
