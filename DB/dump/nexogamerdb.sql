-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: nexogamerdb
-- ------------------------------------------------------
-- Server version	10.11.6-MariaDB-0+deb12u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `juegoId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `juegoId` (`juegoId`),
  KEY `userId` (`userId`),
  CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`juegoId`) REFERENCES `juegos` (`id`),
  CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
INSERT INTO `carrito` VALUES
(1,1,1,1);
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentariosJuegos`
--

DROP TABLE IF EXISTS `comentariosJuegos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentariosJuegos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comentario` varchar(500) DEFAULT NULL,
  `juegoId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `juegoId` (`juegoId`),
  KEY `userId` (`userId`),
  CONSTRAINT `comentariosJuegos_ibfk_1` FOREIGN KEY (`juegoId`) REFERENCES `juegos` (`id`),
  CONSTRAINT `comentariosJuegos_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentariosJuegos`
--

LOCK TABLES `comentariosJuegos` WRITE;
/*!40000 ALTER TABLE `comentariosJuegos` DISABLE KEYS */;
INSERT INTO `comentariosJuegos` VALUES
(1,'Un xogo donde hai mais inters que personas',1,1),
(2,'Matante correndo',2,2),
(3,'Perfecto jueguito cando javier ta pesado',3,3),
(4,'Mellor serie non pode existir neste planeta',4,4),
(5,'Xoguiño de elevada dificultade',5,5),
(6,'IDK',6,6),
(7,'Ladron promedio = ekko',7,7),
(8,'Tipos caendo',8,8),
(9,'Terceiras sombras mas oscuras',9,9),
(10,'O mare dos piratas',10,10),
(11,'É un xogazo',11,1),
(12,'Está Fernando Alonso, padre. ¿Qué máis queres?',12,4);
/*!40000 ALTER TABLE `comentariosJuegos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favoritos`
--

DROP TABLE IF EXISTS `favoritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favoritos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `juegoId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `esFavorito` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `juegoId` (`juegoId`),
  KEY `userId` (`userId`),
  CONSTRAINT `favoritos_ibfk_1` FOREIGN KEY (`juegoId`) REFERENCES `juegos` (`id`),
  CONSTRAINT `favoritos_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoritos`
--

LOCK TABLES `favoritos` WRITE;
/*!40000 ALTER TABLE `favoritos` DISABLE KEYS */;
INSERT INTO `favoritos` VALUES
(1,1,1,1),
(2,2,2,1),
(3,3,3,1),
(4,4,4,1),
(5,5,5,1),
(6,6,6,1),
(7,7,7,1),
(8,8,8,1),
(9,9,9,1),
(10,10,10,1),
(11,11,1,1),
(12,12,7,1);
/*!40000 ALTER TABLE `favoritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juegos`
--

DROP TABLE IF EXISTS `juegos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `juegos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `genero` varchar(200) DEFAULT NULL,
  `fechaSalida` year(4) DEFAULT NULL,
  `consola` varchar(200) DEFAULT NULL,
  `descripcion` varchar(1000) DEFAULT NULL,
  `urlImagen` varchar(200) DEFAULT NULL,
  `compañia` varchar(1000) DEFAULT NULL,
  `valoracion` int(11) DEFAULT NULL,
  `alias` varchar(50) DEFAULT NULL,
  `precio` decimal(4,2) DEFAULT NULL,
  `rebaja` int(11) DEFAULT NULL,
  `comentarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comentarioId` (`comentarioId`),
  CONSTRAINT `juegos_ibfk_1` FOREIGN KEY (`comentarioId`) REFERENCES `comentariosJuegos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juegos`
--

LOCK TABLES `juegos` WRITE;
/*!40000 ALTER TABLE `juegos` DISABLE KEYS */;
INSERT INTO `juegos` VALUES
(1,'League of Legends','Moba',2009,'Ordenador','League of Legends es un juego de estrategia en tiempo real donde dos equipos de cinco jugadores compiten para destruir la base enemiga. Cada jugador controla un campeón único con habilidades especiales, y la cooperación en equipo es esencial para la victoria. Con constantes actualizaciones de contenido y una gran variedad de campeones, LoL ha sido un pilar en la escena de los deportes electrónicos desde su lanzamiento en 2009.','https://static.lolwallpapers.net/2016/09/57e172aea297c.jpg','Riot Games',3,'lol',0.00,0,1),
(2,'Valorant','Shooter',2019,'Ordenador','Valorant es un shooter táctico en primera persona desarrollado por Riot Games, donde dos equipos de cinco jugadores compiten en rondas para completar objetivos. Cada jugador elige un agente con habilidades únicas que complementan la estrategia del equipo. Con un enfoque en la precisión y la coordinación del equipo, Valorant combina elementos de juego táctico con mecánicas de disparos rápidos. Desde su lanzamiento en 2020, Valorant ha ganado popularidad como un título destacado en el género de los shooters tácticos.','https://wallpapers.com/images/hd/valorant-1920x1080-oyk1prl7pymr3uil.jpg','Riot Games',4,'',0.00,0,2),
(3,'Stardew Valley','Simulacion',2016,'Ordenador','Stardew Valley es un juego de simulación de granja desarrollado por ConcernedApe, donde los jugadores heredan una granja y trabajan para restaurarla a su antigua gloria. Los jugadores cultivan cultivos, cuidan animales, pescan y exploran la encantadora ciudad rural de Stardew Valley. Con una jugabilidad relajante y una amplia variedad de actividades, el juego ofrece una experiencia tranquila y gratificante. Desde su lanzamiento en 2016, Stardew Valley ha sido elogiado por su encanto, profundidad y capacidad para cautivar a los jugadores con su estilo de vida rural virtual.','https://images4.alphacoders.com/782/thumb-1920-782781.png','ConcernedApe, Sickhead Games, The Secret Police Limited',5,'',11.15,25,3),
(4,'Inazuma Eleven: Heroes Victory Road','Rol',2024,'Ordenador/Nintendo Switch/Xbox/Playstation/Teléfono','Inazuma Eleven: Heroes Victory Road es un juego de rol y fútbol desarrollado por Level-5 para la consola Nintendo 3DS. Los jugadores asumen el papel de un entrenador que lidera un equipo de fútbol en su camino hacia la victoria. Con mecánicas de juego únicas que combinan elementos de RPG y deportes, los jugadores reclutan jugadores, entrenan habilidades y compiten en emocionantes partidos. Con su cautivadora historia y carismáticos personajes, Heroes Victory Road ofrece una experiencia emocionante tanto para los fanáticos de Inazuma Eleven como para los amantes de los juegos de rol.','https://s1.dmcdn.net/v/Ukjt21a2WpK-Z8Ebu/x1080','Level-5',5,'',80.00,15,4),
(5,'Elden Ring','Rol',2022,'Ordenador/Playstation/Xbox','Elden Ring es un esperado juego de rol de acción desarrollado por FromSoftware en colaboración con el autor de fantasía George R. R. Martin. Ambientado en un vasto mundo abierto lleno de misterio y peligro, los jugadores exploran paisajes épicos, enfrentan desafiantes enemigos y descubren una historia rica en lore. Con un énfasis en la exploración, la personalización del personaje y el combate desafiante, Elden Ring promete ofrecer una experiencia inmersiva para los aficionados de los juegos de rol y los seguidores de la obra de Martin. Su lanzamiento altamente anticipado ha generado gran expectativa entre la comunidad de videojuegos.','https://i.pinimg.com/originals/e2/1a/2b/e21a2bdde2ed989cd64148d460cf7104.jpg','FromSoftware',5,'',30.00,40,5),
(6,'Red Dead Redemption 2','Acción/Aventuras',2018,'Playstation/Xbox/Ordenador','Red Dead Redemption 2 es un épico juego de acción y aventura desarrollado por Rockstar Games. Ambientado en el Salvaje Oeste estadounidense a fines del siglo XIX, el juego sigue la historia de Arthur Morgan, un forajido y miembro de la banda de Van der Linde. Los jugadores exploran un vasto y detallado mundo abierto, participan en actividades como la caza, la pesca y el juego, y se enfrentan a peligros tanto humanos como naturales. Con una narrativa inmersiva, personajes memorables y un impresionante nivel de detalle, Red Dead Redemption 2 es aclamado como uno de los mejores juegos de la última década.','https://s1.1zoom.me/big7/565/Red_Dead_Redemption_2_Men_Rifles_Arthur_Morgan_Hat_580584_1920x1080.jpg','Rockstar Games',5,'',50.46,18,6),
(7,'Grand Theft Auto V','Acción/Aventuras',2013,'Playstation/Xbox/Ordenador','Grand Theft Auto V (GTA V) es un juego de acción y aventura desarrollado por Rockstar Games. Ambientado en la ficticia ciudad de Los Santos y sus alrededores, los jugadores asumen el papel de tres protagonistas: Michael, Franklin y Trevor, quienes se involucran en una serie de actividades criminales mientras navegan por el mundo del crimen organizado, la corrupción y la traición. Con su vasto mundo abierto, repleto de misiones, actividades secundarias y un modo multijugador robusto, GTA V ofrece una experiencia de juego dinámica y llena de acción. Desde su lanzamiento en 2013, ha sido uno de los juegos más exitosos y aclamados por la crítica de todos los tiempos.','https://i.pinimg.com/originals/b3/41/0a/b3410a93baab7154a78187222b753f27.jpg','Rockstar Games',5,'gta5',15.00,60,7),
(8,'Fall Guys','Battle Royale',2020,'Nintendo Switch/Playstation/Ordenador/Xbox','Fall Guys: Ultimate Knockout es un juego de tipo battle royale desarrollado por Mediatonic. En él, hasta 60 jugadores controlan adorables personajes llamados \"Fall Guys\" en una serie de desafiantes pruebas y obstáculos en una competencia estilo juego de televisión. Los jugadores deben superar diversos obstáculos, competir en mini-juegos y evitar caer en eliminaciones hasta que solo quede un ganador. Con su diseño colorido, mecánicas simples pero divertidas, y la emoción de la competencia multijugador, Fall Guys ha ganado popularidad como un juego socialmente divertido y accesible para jugadores de todas las edades.','https://images6.alphacoders.com/125/1250786.jpg','Mediatonic',5,'',10.98,33,8),
(9,'Dark Souls III','Rol',2016,'Xbox/Playstation/Ordenador','Dark Souls 3 es un desafiante juego de rol de acción desarrollado por FromSoftware. Situado en un oscuro y desolado mundo de fantasía, los jugadores asumen el papel de un no muerto que se aventura a través de peligrosas tierras en busca de la salvación. Con combates intensos y estratégicos, un mundo interconectado lleno de secretos y una atmósfera opresiva, Dark Souls 3 ofrece una experiencia inmersiva y desafiante. La habilidad del jugador para aprender y adaptarse es fundamental para sobrevivir en este mundo brutal y hostil. Desde su lanzamiento, ha sido elogiado por su diseño de niveles ingenioso, su jugabilidad satisfactoria y su narrativa ambiental profunda.','https://images3.alphacoders.com/600/600925.jpg','FromSoftware',5,'',14.58,55,9),
(10,'Sea of Thieves','Acción/Aventuras',2018,'Playstation/Xbox/Ordenador','Sea of Thieves es un juego de aventuras en línea desarrollado por Rare Ltd. En él, los jugadores asumen el papel de piratas que navegan por un vasto mundo abierto lleno de islas exóticas, tesoros ocultos y peligrosos enemigos. Ya sea explorando islas misteriosas, enfrentándose a otros jugadores en batallas navales o buscando tesoros enterrados, la cooperación en equipo y la comunicación son clave para el éxito. Con su estilo visual único y su enfoque en la libertad de juego, Sea of Thieves ofrece una experiencia de piratería llena de diversión y aventura para jugadores de todas las edades.','https://sm.ign.com/ign_es/screenshot/default/3b9907bf-92ef-46e4-9a02-ecbd453252cc_qw3c.jpg','Rare',5,'',34.95,20,10),
(11,'Dead by Daylight','Survival horror',2016,'Ordenador/Playstation/Nintendo Switch','Dead by Daylight es un videojuego de terror multijugador asimétrico en el que cuatro jugadores controlan a supervivientes y deben escapar de un asesino, mientras que un jugador asume el papel del asesino y trata de capturar y sacrificar a los supervivientes. Los supervivientes deben completar una serie de generadores para abrir las puertas de escape, mientras evitan ser capturados y sacrificados por el asesino en un entorno oscuro y peligroso. Con una atmósfera tensa y emocionante, \"Dead by Daylight\" ofrece una experiencia de juego única y llena de adrenalina tanto para los jugadores de supervivientes como para el asesino.','https://images4.alphacoders.com/133/1334860.jpeg','Behaviour Interactive',4,'dbd',12.10,10,11),
(12,'Fórmula 1 2024','Simulación',2024,'Ordenador/Playstation','En el juego de Fórmula 1 2024, los jugadores experimentan la emoción de la competición de élite con gráficos de vanguardia y una jugabilidad mejorada. Puedes competir como tus pilotos favoritos o crear tu propio equipo, gestionando todo, desde el desarrollo del coche hasta las estrategias de carrera. Sumérgete en la acción de las carreras más emocionantes del mundo y conquista el campeonato.','https://areajugones.sport.es/wp-content/uploads/2024/04/f1-24.jpg','Codemasters',4,'f1',69.99,33,12);
/*!40000 ALTER TABLE `juegos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plataformasJuegos`
--

DROP TABLE IF EXISTS `plataformasJuegos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plataformasJuegos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `juegoId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `juegoId` (`juegoId`),
  CONSTRAINT `plataformasJuegos_ibfk_1` FOREIGN KEY (`juegoId`) REFERENCES `juegos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plataformasJuegos`
--

LOCK TABLES `plataformasJuegos` WRITE;
/*!40000 ALTER TABLE `plataformasJuegos` DISABLE KEYS */;
INSERT INTO `plataformasJuegos` VALUES
(1,'Indie',1),
(2,'Indie',2),
(3,'Steam',3),
(4,'Level-5',4),
(5,'Steam',5),
(6,'Rockstar Games',6),
(7,'Rockstar Games',7),
(8,'Epic Games',8),
(9,'Steam',9),
(10,'Steam',10),
(11,'Steam',11),
(12,'Steam',12);
/*!40000 ALTER TABLE `plataformasJuegos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `contraseña` varchar(200) DEFAULT NULL,
  `telefono` char(9) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `juegoFavoritoId` int(11) DEFAULT NULL,
  `comentarioJuegoId` int(11) DEFAULT NULL,
  `sessionToken` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `juegoFavoritoId` (`juegoFavoritoId`),
  KEY `comentarioJuegoId` (`comentarioJuegoId`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`juegoFavoritoId`) REFERENCES `favoritos` (`id`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`comentarioJuegoId`) REFERENCES `comentariosJuegos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'John','Doe','Contraseña123','123456789','john.doe@email.com',1,1,NULL),
(2,'Jane','Smith','OtraContraseña','987654321','jane.smith@email.com',2,2,NULL),
(3,'Michael','Johnson','Pass123','555666777','michael.johnson@email.com',3,3,NULL),
(4,'Emily','Williams','SecurePwd','111222333','emily.williams@email.com',4,4,NULL),
(5,'David','Brown','SecretPass','999888777','david.brown@email.com',5,5,NULL),
(6,'Olivia','Davis','Hidden123','333444555','olivia.davis@email.com',6,6,NULL),
(7,'William','Martinez','TopSecret','777888999','william.martinez@email.com',7,7,NULL),
(8,'Sophia','Anderson','Confidential','444555666','sophia.anderson@email.com',8,8,NULL),
(9,'James','Taylor','Secure123','666777888','james.taylor@email.com',9,9,NULL),
(10,'Emma','Hernandez','SafePwd','888999000','emma.hernandez@email.com',10,10,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-25 13:31:12
