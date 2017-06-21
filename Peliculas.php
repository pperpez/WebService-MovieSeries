<?php
require 'Database.php';
class Peliculas
{
    function __construct()
    {
    }
    public static function getSeries()
    {
        $consulta = "SELECT idPelicula, Titulo, Imagen FROM peliculas WHERE Serie = 0";
        try {
            $comando = Database::getInstance()->getDb()->prepare($consulta);
            $comando->execute();
            return $comando->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            return false;
        }
    }
    public static function getPeliculas()
    {
        $consulta = "SELECT idPelicula, Titulo, Imagen FROM peliculas WHERE Serie = 1";
        try {
            $comando = Database::getInstance()->getDb()->prepare($consulta);
            $comando->execute();
            return $comando->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            return false;
        }
    }

    public static function getById($idPelicula)
    {
        $consulta = "SELECT *
                             FROM peliculas
                             WHERE idPelicula = ?";
        try {
            $comando = Database::getInstance()->getDb()->prepare($consulta);
            $comando->execute(array($idPelicula));
            $row = $comando->fetch(PDO::FETCH_ASSOC);
            return $row;
        } catch (PDOException $e) {
            return false;
        }
    }
    public static function getComentarios($idPelicula)
    {
        $consulta = "SELECT NombreLogin, Comentario
                             FROM peliculas JOIN usuario_pelicula_comentario ON (peliculas.idPelicula=usuario_pelicula_comentario.idPelicula) JOIN usuarios ON (usuario_pelicula_comentario.idUsuario=usuarios.idUsuario)
                             WHERE peliculas.idPelicula = ?";
        try {
            $comando = Database::getInstance()->getDb()->prepare($consulta);
            $comando->execute(array($idPelicula));
            return $comando->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            return false;
        }
    }

    public static function insertComentario(
        $idPelicula,
        $idUsuario,
        $comentario
    )
    {
        try{
        $comando = "INSERT INTO usuario_pelicula_comentario ( " .
            "idPelicula," .
            "idUsuario," .
            " Comentario)" .
            " VALUES( ?,?,?)";
        $sentencia = Database::getInstance()->getDb()->prepare($comando);
        return $sentencia->execute(
            array(
                $idPelicula,
                $idUsuario,
                $comentario
            )
        );
        } catch (PDOException $e) {
          return false;
        }
    }

    public static function getDirector($idPelicula)
    {
        $consulta = "SELECT Nombre, Apellidos
					 FROM personas JOIN personas_pelicula ON (personas.idPersona=personas_pelicula.idPersona) JOIN profesiones ON (personas_pelicula.idProfesion=profesiones.idProfesion) JOIN peliculas ON (personas_pelicula.idPelicula=peliculas.idPelicula)
					 WHERE peliculas.idPelicula = ? and profesiones.idProfesion=2";
        try {
            $comando = Database::getInstance()->getDb()->prepare($consulta);
            $comando->execute(array($idPelicula));
            return $comando->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            return false;
        }
    }

    public static function getReparto($idPelicula)
    {
        $consulta = "SELECT Nombre, Apellidos
                                         FROM personas JOIN personas_pelicula ON (personas.idPersona=personas_pelicula.idPersona) JOIN profesiones ON (personas_pelicula.idProfesion=profesiones.idProfesion) JOIN peliculas ON (personas_pelicula.idPelicula=peliculas.idPelicula)
                                         WHERE peliculas.idPelicula = ? and profesiones.idProfesion=1";
        try {
            $comando = Database::getInstance()->getDb()->prepare($consulta);
            $comando->execute(array($idPelicula));
            return $comando->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            return false;
        }
    }

    public static function getValoracionUsuario($idPelicula, $idUsuario)
    {
        $consulta = "SELECT Puntuacion
                             FROM peliculas JOIN usuario_pelicula_puntuacion ON (peliculas.idPelicula=usuario_pelicula_puntuacion.idPelicula) JOIN usuarios ON (usuario_pelicula_puntuacion.idUsuario=usuarios.idUsuario)
                             WHERE peliculas.idPelicula = ? and usuarios.idUsuario = ?";
        try {
            $comando = Database::getInstance()->getDb()->prepare($consulta);
            $comando->execute(array($idPelicula, $idUsuario));
            return $comando->fetch(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            return false;
        }
    }

    public static function getValoracionGeneral($idPelicula)
    {
        $consulta = "SELECT AVG(Puntuacion) as 'Puntuacion'
                             FROM peliculas JOIN usuario_pelicula_puntuacion ON (peliculas.idPelicula=usuario_pelicula_puntuacion.idPelicula) JOIN usuarios ON (usuario_pelicula_puntuacion.idUsuario=usuarios.idUsuario)
                             WHERE peliculas.idPelicula = ?";
        try {
            $comando = Database::getInstance()->getDb()->prepare($consulta);
            $comando->execute(array($idPelicula));
            return $comando->fetch(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            return false;
        }
    }

    public static function getGenero($idPelicula)
    {
        $consulta = "SELECT Descripcion
				 FROM generos JOIN pelicula_genero ON (generos.idGenero=pelicula_genero.idGenero) JOIN peliculas ON (peliculas.idPelicula=pelicula_genero.idPelicula)
				 WHERE peliculas.idPelicula = ?";
        try {
            $comando = Database::getInstance()->getDb()->prepare($consulta);
            $comando->execute(array($idPelicula));
			return $comando->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            return false;
        }
    }

    public static function updateValoracion(
        $idUsuario,
        $idPelicula,
        $valoracion
    )
    {
        $consulta = "UPDATE usuario_pelicula_puntuacion" .
            " SET Puntuacion=? " .
            "WHERE idUsuario=? and idPelicula=?";
        $comando = Database::getInstance()->getDb()->prepare($consulta);
        $comando->execute(array($valoracion, $idUsuario, $idPelicula));
        return $comando;
    }

    public static function insertValoracion(
        $idUsuario,
        $idPelicula,
        $valoracion
    )
    {
        try{
        $comando = "INSERT INTO usuario_pelicula_puntuacion ( " .
                "idUsuario," .
                "idPelicula," .
                " Puntuacion)" .
                " VALUES( ?,?,?)";
        $sentencia = Database::getInstance()->getDb()->prepare($comando);
        return $sentencia->execute(
                array(
                        $idUsuario,
                        $idPelicula,
                        $valoracion
                )
        );
        }catch (PDOException $e) {
           return false;
        }
    }

    public static function getPeliculasLista($idLista)
    {
        $consulta = "SELECT peliculas.idPelicula, Titulo, Imagen
                             FROM peliculas JOIN lista_has_peliculas ON (peliculas.idPelicula=lista_has_peliculas.idPelicula)
                             WHERE idLista = ?";
        try {
            $comando = Database::getInstance()->getDb()->prepare($consulta);
            $comando->execute(array($idLista));
            return $comando->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            return false;
        }
    }

    public static function getPeliculasSeries()
    {
        $consulta = "SELECT idPelicula, Titulo, Imagen
                             FROM peliculas";
        try {
            $comando = Database::getInstance()->getDb()->prepare($consulta);
            $comando->execute();
            return $comando->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            return -1;
        }
    }

    public static function insertPeliculaLista(
        $idLista,
        $idPelicula
    )
    {
        try{
        $comando = "INSERT INTO lista_has_peliculas ( " .
            "idLista," .
            " idPelicula)" .
            " VALUES( ?,?)";
        $sentencia = Database::getInstance()->getDb()->prepare($comando);
        return $sentencia->execute(
            array(
                $idLista,
                $idPelicula
            )
        );
        } catch (PDOException $e) {
            return false;
        }

    }

    public static function deletePeliculaLista($idLista, $idPelicula)
    {
        $comando = "DELETE FROM lista_has_peliculas WHERE idLista=? and idPelicula=?";
        $sentencia = Database::getInstance()->getDb()->prepare($comando);
        return $sentencia->execute(array($idLista, $idPelicula));
    }
}
?>
