-- MySQL dump 10.14  Distrib 5.5.52-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: movieseries
-- ------------------------------------------------------
-- Server version	5.5.52-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS movieseries;
CREATE DATABASE movieseries;
USE movieseries

--
-- Table structure for table `generos`
--

DROP TABLE IF EXISTS `generos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generos` (
  `idGenero` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`idGenero`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generos`
--

LOCK TABLES `generos` WRITE;
/*!40000 ALTER TABLE `generos` DISABLE KEYS */;
INSERT INTO `generos` VALUES (1,'Bélico'),(2,'Drama'),(3,'Thriller'),(4,'Suspense'),(5,'Policíaco'),(6,'Fantástico'),(7,'Acción'),(8,'Aventuras'),(9,'Ciencia ficción');
/*!40000 ALTER TABLE `generos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_has_peliculas`
--

DROP TABLE IF EXISTS `lista_has_peliculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lista_has_peliculas` (
  `idLista` int(11) NOT NULL,
  `idPelicula` int(11) NOT NULL,
  PRIMARY KEY (`idLista`,`idPelicula`),
  KEY `pelicula_fk_idx` (`idPelicula`),
  KEY `pelicula_lista_fk_idx` (`idPelicula`),
  CONSTRAINT `pelicula_lista_fk` FOREIGN KEY (`idPelicula`) REFERENCES `peliculas` (`idPelicula`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_has_peliculas`
--

LOCK TABLES `lista_has_peliculas` WRITE;
/*!40000 ALTER TABLE `lista_has_peliculas` DISABLE KEYS */;
/*!40000 ALTER TABLE `lista_has_peliculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listas`
--

DROP TABLE IF EXISTS `listas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listas` (
  `idLista` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idLista`),
  KEY `lista_usuario_fk_idx` (`idUsuario`),
  CONSTRAINT `usuario_lista_fk` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listas`
--

LOCK TABLES `listas` WRITE;
/*!40000 ALTER TABLE `listas` DISABLE KEYS */;
/*!40000 ALTER TABLE `listas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula_genero`
--

DROP TABLE IF EXISTS `pelicula_genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelicula_genero` (
  `idPelicula` int(11) NOT NULL,
  `idGenero` int(11) NOT NULL,
  PRIMARY KEY (`idPelicula`,`idGenero`),
  KEY `genero_fk_idx` (`idGenero`),
  CONSTRAINT `genero_fk` FOREIGN KEY (`idGenero`) REFERENCES `generos` (`idGenero`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pelicula_fk` FOREIGN KEY (`idPelicula`) REFERENCES `peliculas` (`idPelicula`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_genero`
--

LOCK TABLES `pelicula_genero` WRITE;
/*!40000 ALTER TABLE `pelicula_genero` DISABLE KEYS */;
INSERT INTO `pelicula_genero` VALUES (1,2),(1,3),(1,5),(6,2),(6,3),(6,5),(7,2),(7,6),(7,7),(7,8),(8,2),(8,3),(9,1),(9,2),(10,2),(11,2),(11,3),(12,3),(12,7),(12,8),(12,9),(13,2),(14,1),(14,2);
/*!40000 ALTER TABLE `pelicula_genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peliculas`
--

DROP TABLE IF EXISTS `peliculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peliculas` (
  `idPelicula` int(11) NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(100) NOT NULL,
  `DuracionMinutos` int(3) NOT NULL,
  `AnyoLanzamiento` int(4) NOT NULL,
  `Sinopsis` varchar(900) NOT NULL,
  `TrailerURL` varchar(45) DEFAULT NULL,
  `Serie` tinyint(4) NOT NULL,
  `Imagen` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idPelicula`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peliculas`
--

LOCK TABLES `peliculas` WRITE;
/*!40000 ALTER TABLE `peliculas` DISABLE KEYS */;
INSERT INTO `peliculas` VALUES (1,'The Wire',60,2002,'Serie de TV de 60 episodios (2002-2008). En los barrios bajos de Baltimore, se investiga un asesinato relacionado con el mundo de las drogas. Un policía es el encargado de detener a los miembros de un importante cártel. La corrupción policial, las frágiles lealtades dentro de los cárteles y la miseria vinculada al narcotráfico son algunos de los problemas denunciados en esta serie.','https://www.youtube.com/watch?v=uDcQbk78CSw',0,'the-wire.jpg'),(6,'Breaking Bad',45,2008,'Serie de TV (2008-2013). 5 temporadas. 62 episodios. Tras cumplir 50 años, Walter White (Bryan Cranston), un profesor de química de un instituto de Albuquerque, Nuevo México, se entera de que tiene un cáncer de pulmón incurable. Casado con Skyler (Anna Gunn) y con un hijo discapacitado (RJ Mitte), la brutal noticia lo impulsa a dar un drástico cambio a su vida: decide, con la ayuda de un antiguo alumno (Aaron Paul), fabricar anfetaminas y ponerlas a la venta. Lo que pretende es liberar a su familia de problemas económicos cuando se produzca el fatal desenlace.','https://www.youtube.com/watch?v=XZ8daibM3AE',0,'breaking-bad.jpg'),(7,'Juego de Tronos',55,2011,'Serie de TV (2011-Actualidad). La historia de Juego de Tronos transcurre en un mundo fantástico con reminiscencias de la Europa de la Edad Media. En el que la magia y las criaturas míticas del pasado han quedado en el olvido. En el continente de Poniente, donde las estaciones duran décadas y los inviernos son tiempos duros, se acerca el final del largo verano. Pocos años después de la revuelta que puso fin al reinado de la dinastía Targaryen, Robert Baratheon, que lideró a los nobles rebeldes, ocupa ahora el trono de hierro de los siete reinos. Sin embargo, las pugnas por el poder entre las principales casas nobles salen cada vez más abiertamente a la luz. Además, inquietantes sucesos acontecen en el norte, más allá del gigantesco muro que separa los siete reinos de las tierras salvajes. Todo hace pensar que el equilibrio en Poniente está a punto de romperse de nuevo.','https://www.youtube.com/watch?v=BpJYNVhGf1s',0,'juego-de-tronos.jpg'),(8,'Los Soprano',50,1999,'Serie de TV (1999-2007). 6 temporadas. 86 episodios. Crónica de la vida cotidiana y de las aventuras personales y profesionales de una familia mafiosa que vive en Nueva Jersey. Son gentes sencillas, pero implacables en sus ritos y tradiciones. La trama se basa en las confidencias del \"capo\" Tony Soprano (James Gandolfini) a su psicoanalista, la doctora Melfi (Lorraine Bracco). ','https://www.youtube.com/watch?v=LBdIcvv864I',0,'the-sopranos.jpg'),(9,'Hermanos de Sangre',60,2001,'Miniserie de TV de 10 episodios que se basa en el bestseller de Stephen E. Ambrose \"Band Of Brothers\". Narra la historia de la Easy Company, un batallón americano del regimiento 506 de paracaidistas que luchó en Europa durante la II Guerra Mundial (1939-1945). Incluye entrevistas a los supervivientes, recuerdos de los periodistas y cartas de los soldados.','https://www.youtube.com/watch?v=1wlYPlwjGOY',0,'hermanos-de-sangre.jpg'),(10,'Cadena Perpetua',142,1994,'Acusado del asesinato de su mujer, Andrew Dufresne (Tim Robbins), tras ser condenado a cadena perpetua, es enviado a la cárcel de Shawshank. Con el paso de los años conseguirá ganarse la confianza del director del centro y el respeto de sus compañeros de prisión, especialmente de Red (Morgan Freeman), el jefe de la mafia de los sobornos.','https://www.youtube.com/watch?v=K_tLp7T6U1c',1,'caden-perpetua.jpg'),(11,'Pulp Fiction',153,1994,'Jules y Vincent, dos asesinos a sueldo con no demasiadas luces, trabajan para el gángster Marsellus Wallace. Vincent le coinfiesa a Jules que Marsellus le ha pedido que cuide de Mia, su atractiva mujer. Jules le recomienda prudencia porque es muy peligroso sobrepasarse con la novia del jefe. Cuando llega la hora de trabjar, ambos deben ponerse \"manos a la obra\". Su misión: recuperar un misterioso maletín.','https://www.youtube.com/watch?v=s7EdQ4FqbhY',1,'pulp-fiction.jpg'),(12,'Origen',148,2010,'Dom Cobb (DiCaprio) es un experto en el arte de apropiarse, durante el sueño, de los secretos del subconsciente ajeno. La extraña habilidad de Cobb le ha convertido en un hombre muy cotizado en el mundo del espionaje, pero también lo ha condenado a ser un fugitivo y, por consiguiente, a renunciar a llevar una vida normal. Su única oportunidad para cambiar de vida será hacer exactamente lo contrario de lo que ha hecho siempre: la incepción, que consiste en implantar una idea en el subconsciente en lugar de sustraerla. Sin embargo, su plan se complica debido a la intervención de alguien que parece predecir cada uno de sus movimientos, alguien a quien sólo Cobb podrá descubrir.','https://www.youtube.com/watch?v=YoHD9XEInc0',1,'origen.jpg'),(13,'El Club de la Lucha',139,1999,'Un joven hastiado de su gris y monótona vida lucha contra el insomnio. En un viaje en avión conoce a un carismático vendedor de jabón que sostiene una teoría muy particular: el perfeccionismo es cosa de gentes débiles; sólo la autodestrucción hace que la vida merezca la pena. Ambos deciden entonces fundar un club secreto de lucha, donde poder descargar sus frustaciones y su ira, que tendrá un éxito arrollador.','https://www.youtube.com/watch?v=D3Yw9Yc1YmY',1,'club-de-la-lucha.jpg'),(14,'La Vida es Bella',117,1997,'En 1939, a punto de estallar la Segunda Guerra Mundial (1939-1945), el extravagante Guido llega a Arezzo (Toscana) con la intención de abrir una librería. Allí conoce a Dora y, a pesar de que es la prometida del fascista Rodolfo, se casa con ella y tiene un hijo. Al estallar la guerra, los tres son internados en un campo de exterminio, donde Guido hará lo imposible para hacer creer a su hijo que la terrible situación que están padeciendo es tan sólo un juego.','https://www.youtube.com/watch?v=pAYEQP8gx3w',1,'la-vida-es-bella.jpg');
/*!40000 ALTER TABLE `peliculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personas` (
  `idPersona` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Apellidos` varchar(100) NOT NULL,
  `Genero` varchar(45) NOT NULL,
  PRIMARY KEY (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (1,'David','Simon','Hombre'),(2,'Dominic','West','Hombre'),(3,'Lance','Reddick','Hombre'),(4,'Sonja','Sohn','Mujer'),(5,'Vince','Gilligan','Hombre'),(6,'Bryan','Cranston','Hombre'),(7,'Aaron','Paul','Hombre'),(8,'Anna','Gunn','Mujer'),(9,'David','Benioff','Hombre'),(10,'D.B.','Weiss','Hombre'),(11,'Emilia','Clarke','Mujer'),(12,'Peter','Dinklage','Hombre'),(13,'Kit','Harington','Hombre'),(14,'David','Chase','Hombre'),(15,'James','Gandolfini','Hombre'),(16,'Lorraine','Bracco','Mujer'),(17,'Edie','Falco','Hombre'),(18,'Stephen','Ambrose','Hombre'),(19,'Scott','Grimes','Hombre'),(20,'Damian','Lewis','Hombre'),(21,'Ron','Livingston','Hombre'),(22,'Quentin','Tarantino','Hombre'),(23,'John','Travolta','Hombre'),(24,'Uma','Thurman','Mujer'),(25,'Samuel L.','Jackson','Hombre'),(26,'Christopher','Nolan','Hombre'),(27,'Leonardo','DiCaprio','Hombre'),(28,'Joseph','Gordon-Levitt','Hombre'),(29,'Ellen','Page','Mujer'),(30,'David','Fincher','Hombre'),(31,'Brad','Pitt','Hombre'),(32,'Edward','Norton','Hombre'),(33,'Meat','Loaf','Hombre'),(34,'Roberto','Benigni','Hombre'),(35,'Nicoletta','Braschi','Mujer'),(36,'Giorgio','Cantarini','Hombre'),(37,'Frank','Darabont','Hombre'),(38,'Tim','Robbins','Hombre'),(39,'Morgan','Freeman','Hombre'),(40,'Bob','Gunton','Hombre');
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas_pelicula`
--

DROP TABLE IF EXISTS `personas_pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personas_pelicula` (
  `idPelicula` int(11) NOT NULL,
  `idPersona` int(11) NOT NULL,
  `idProfesion` int(11) NOT NULL,
  `personaje_pelicula` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`idPelicula`,`idPersona`),
  KEY `persona_profesion_fk_idx` (`idProfesion`),
  KEY `persona_pelicula_fk_idx` (`idPersona`),
  CONSTRAINT `pelicula_persona_fk` FOREIGN KEY (`idPelicula`) REFERENCES `peliculas` (`idPelicula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `persona_pelicula_fk` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `persona_profesion_fk` FOREIGN KEY (`idProfesion`) REFERENCES `profesiones` (`idProfesion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas_pelicula`
--

LOCK TABLES `personas_pelicula` WRITE;
/*!40000 ALTER TABLE `personas_pelicula` DISABLE KEYS */;
INSERT INTO `personas_pelicula` VALUES (1,1,2,NULL),(1,2,1,'James \'Jimmy\' McNulty'),(1,3,1,'Cedric Daniels'),(1,4,1,'Shakima \'Kima\' Greggs'),(6,5,2,NULL),(6,6,1,'Walter White'),(6,7,1,'Jesse Pinkman'),(6,8,1,'Skyler White'),(7,9,2,NULL),(7,10,2,NULL),(7,11,1,'Daenerys Targaryen'),(7,12,1,'Tyrion Lannister'),(7,13,1,'Jon Snow'),(8,14,2,NULL),(8,15,1,'Tony Soprano'),(8,16,1,'Jennifer Melfi'),(8,17,1,'Carmela Soprano'),(9,18,2,NULL),(9,19,1,'Donald G. Malarkey'),(9,20,1,'Richard D. Winters'),(9,21,1,'Lewis Nixon'),(10,37,2,NULL),(10,38,1,'Andy Dufresne'),(10,39,1,'Ellis Boyd'),(10,40,1,'Warden Norton'),(11,22,2,NULL),(11,23,1,'Vincent Vega'),(11,24,1,'Mia Wallace'),(11,25,1,'Jules Winnfield'),(12,26,2,NULL),(12,27,1,'Cobb'),(12,28,1,'Arthur'),(12,29,1,'Ariadne'),(13,30,2,NULL),(13,31,1,'Tyler Durden'),(13,32,1,'Narrator'),(13,33,1,'Robert \'Bob\' Paulsen'),(14,34,2,''),(14,35,1,'Dora'),(14,36,1,'Giosué');
/*!40000 ALTER TABLE `personas_pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesiones`
--

DROP TABLE IF EXISTS `profesiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profesiones` (
  `idProfesion` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(75) NOT NULL,
  PRIMARY KEY (`idProfesion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesiones`
--

LOCK TABLES `profesiones` WRITE;
/*!40000 ALTER TABLE `profesiones` DISABLE KEYS */;
INSERT INTO `profesiones` VALUES (1,'Actriz/Actor'),(2,'Director/Directora');
/*!40000 ALTER TABLE `profesiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_pelicula_comentario`
--

DROP TABLE IF EXISTS `usuario_pelicula_comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_pelicula_comentario` (
  `idUsuario` int(11) NOT NULL,
  `idPelicula` int(11) NOT NULL,
  `Comentario` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`,`idPelicula`),
  KEY `pelicula_usuario_comentario_fk_idx` (`idPelicula`),
  CONSTRAINT `pelicula_usuario_comentario_fk` FOREIGN KEY (`idPelicula`) REFERENCES `peliculas` (`idPelicula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuario_pelicula_comentario_fk` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_pelicula_comentario`
--

LOCK TABLES `usuario_pelicula_comentario` WRITE;
/*!40000 ALTER TABLE `usuario_pelicula_comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_pelicula_comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_pelicula_puntuacion`
--

DROP TABLE IF EXISTS `usuario_pelicula_puntuacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_pelicula_puntuacion` (
  `idUsuario` int(11) NOT NULL,
  `idPelicula` int(11) NOT NULL,
  `Puntuacion` float NOT NULL,
  PRIMARY KEY (`idUsuario`,`idPelicula`),
  KEY `pelicula_usuario_puntuacion_fk_idx` (`idPelicula`),
  CONSTRAINT `pelicula_usuario_fk` FOREIGN KEY (`idPelicula`) REFERENCES `peliculas` (`idPelicula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuario_pelicula_fk` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_pelicula_puntuacion`
--

LOCK TABLES `usuario_pelicula_puntuacion` WRITE;
/*!40000 ALTER TABLE `usuario_pelicula_puntuacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_pelicula_puntuacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `NombreLogin` varchar(50) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Nombre` varchar(70) NOT NULL,
  `Email` varchar(70) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `nombreUsuario_UNIQUE` (`NombreLogin`),
  UNIQUE KEY `email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-20 21:54:03
