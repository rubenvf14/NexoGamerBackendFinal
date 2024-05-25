drop database if exists nexogamerdb;
create database nexogamerdb;
use nexogamerdb;

-- Creación de la tabla de usuarios de la página web de NexoGamer
CREATE TABLE users(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(50),
    apellidos VARCHAR(50),
    contraseña VARCHAR(200),
    telefono CHAR(9),
    email VARCHAR(100),
    juegoFavoritoId INT, /*Clave foránea*/
    comentarioJuegoId INT, /*Clave foránea*/
    sessionToken VARCHAR(500)
);

-- Creación de la tabla de juegos de NexoGamer
CREATE TABLE juegos(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    genero VARCHAR(200),
    fechaSalida YEAR,
    consola VARCHAR(200),
    descripcion VARCHAR(1000),
    urlImagen VARCHAR(200),
    compañia VARCHAR(1000),
    valoracion INT,
    alias VARCHAR(50),
    precio DECIMAL(4,2),
    rebaja INT,
    comentarioId INT /*Clave foránea*/
);

-- Creación de la tabla que albergará todos los comentarios de cada juego. Se hace esta distinción tan clara entre tablas para no equivocarse facilmente
CREATE TABLE comentariosJuegos(
	id INT AUTO_INCREMENT PRIMARY KEY,
    comentario VARCHAR(500),
    juegoId INT, /*Clave foránea*/
    userId INT /*Clave foránea*/
);

-- Creación de la tabla favoritos de NexoGamer
CREATE TABLE favoritos(
	id INT AUTO_INCREMENT PRIMARY KEY,
    juegoId INT, /*Clave foránea*/
    userId INT, /*Clave foránea*/
    esFavorito BOOLEAN
);

-- Creación de la tabla plataformasJuegos que almacenará todas las plataformas como Steam, Epic Games, etc de NexoGamer
CREATE TABLE plataformasJuegos(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    juegoId INT /*Clave foránea*/
);

-- Inserciones de la tabla users
INSERT INTO users (nombre, apellidos, contraseña, telefono, email, juegoFavoritoId, comentarioJuegoId) VALUES
('John', 'Doe', 'Contraseña123', '123456789', 'john.doe@email.com', 1, 1),
('Jane', 'Smith', 'OtraContraseña', '987654321', 'jane.smith@email.com', 2, 2),
('Michael', 'Johnson', 'Pass123', '555666777', 'michael.johnson@email.com', 3, 3),
('Emily', 'Williams', 'SecurePwd', '111222333', 'emily.williams@email.com', 4, 4),
('David', 'Brown', 'SecretPass', '999888777', 'david.brown@email.com', 5, 5),
('Olivia', 'Davis', 'Hidden123', '333444555', 'olivia.davis@email.com', 6, 6),
('William', 'Martinez', 'TopSecret', '777888999', 'william.martinez@email.com', 7, 7),
('Sophia', 'Anderson', 'Confidential', '444555666', 'sophia.anderson@email.com', 8, 8),
('James', 'Taylor', 'Secure123', '666777888', 'james.taylor@email.com', 9, 9),
('Emma', 'Hernandez', 'SafePwd', '888999000', 'emma.hernandez@email.com', 10, 10);

-- Inserciones de la tabla juegos
INSERT INTO juegos (nombre, genero, fechaSalida, consola, descripcion, urlImagen, compañia, valoracion, alias, precio, rebaja, comentarioId) VALUES
('League of Legends','Moba',2009,'Ordenador','League of Legends es un juego de estrategia en tiempo real donde dos equipos de cinco jugadores compiten para destruir la base enemiga. Cada jugador controla un campeón único con habilidades especiales, y la cooperación en equipo es esencial para la victoria. Con constantes actualizaciones de contenido y una gran variedad de campeones, LoL ha sido un pilar en la escena de los deportes electrónicos desde su lanzamiento en 2009.','https://static.lolwallpapers.net/2016/09/57e172aea297c.jpg','Riot Games', 2.5,"lol", 0, 0, 1),
('Valorant','Shooter',2019,'Ordenador','Valorant es un shooter táctico en primera persona desarrollado por Riot Games, donde dos equipos de cinco jugadores compiten en rondas para completar objetivos. Cada jugador elige un agente con habilidades únicas que complementan la estrategia del equipo. Con un enfoque en la precisión y la coordinación del equipo, Valorant combina elementos de juego táctico con mecánicas de disparos rápidos. Desde su lanzamiento en 2020, Valorant ha ganado popularidad como un título destacado en el género de los shooters tácticos.','https://wallpapers.com/images/hd/valorant-1920x1080-oyk1prl7pymr3uil.jpg','Riot Games', 4, "", 0, 0, 2),
('Stardew Valley','Simulacion',2016,'Ordenador','Stardew Valley es un juego de simulación de granja desarrollado por ConcernedApe, donde los jugadores heredan una granja y trabajan para restaurarla a su antigua gloria. Los jugadores cultivan cultivos, cuidan animales, pescan y exploran la encantadora ciudad rural de Stardew Valley. Con una jugabilidad relajante y una amplia variedad de actividades, el juego ofrece una experiencia tranquila y gratificante. Desde su lanzamiento en 2016, Stardew Valley ha sido elogiado por su encanto, profundidad y capacidad para cautivar a los jugadores con su estilo de vida rural virtual.','https://images4.alphacoders.com/782/thumb-1920-782781.png','ConcernedApe, Sickhead Games, The Secret Police Limited', 5, "", 11.15, 25, 3),
('Inazuma Eleven: Heroes Victory Road','Rol',2024,'Ordenador/Nintendo Switch/Xbox/Playstation/Teléfono','Inazuma Eleven: Heroes Victory Road es un juego de rol y fútbol desarrollado por Level-5 para la consola Nintendo 3DS. Los jugadores asumen el papel de un entrenador que lidera un equipo de fútbol en su camino hacia la victoria. Con mecánicas de juego únicas que combinan elementos de RPG y deportes, los jugadores reclutan jugadores, entrenan habilidades y compiten en emocionantes partidos. Con su cautivadora historia y carismáticos personajes, Heroes Victory Road ofrece una experiencia emocionante tanto para los fanáticos de Inazuma Eleven como para los amantes de los juegos de rol.','https://s1.dmcdn.net/v/Ukjt21a2WpK-Z8Ebu/x1080','Level-5', 4.5, "", 80, 15, 4),
('Elden Ring','Rol',2022,'Ordenador/Playstation/Xbox','Elden Ring es un esperado juego de rol de acción desarrollado por FromSoftware en colaboración con el autor de fantasía George R. R. Martin. Ambientado en un vasto mundo abierto lleno de misterio y peligro, los jugadores exploran paisajes épicos, enfrentan desafiantes enemigos y descubren una historia rica en lore. Con un énfasis en la exploración, la personalización del personaje y el combate desafiante, Elden Ring promete ofrecer una experiencia inmersiva para los aficionados de los juegos de rol y los seguidores de la obra de Martin. Su lanzamiento altamente anticipado ha generado gran expectativa entre la comunidad de videojuegos.','https://i.pinimg.com/originals/e2/1a/2b/e21a2bdde2ed989cd64148d460cf7104.jpg','FromSoftware', 4.5, "", 30, 40, 5),
('Red Dead Redemption 2','Acción/Aventuras',2018,'Playstation/Xbox/Ordenador','Red Dead Redemption 2 es un épico juego de acción y aventura desarrollado por Rockstar Games. Ambientado en el Salvaje Oeste estadounidense a fines del siglo XIX, el juego sigue la historia de Arthur Morgan, un forajido y miembro de la banda de Van der Linde. Los jugadores exploran un vasto y detallado mundo abierto, participan en actividades como la caza, la pesca y el juego, y se enfrentan a peligros tanto humanos como naturales. Con una narrativa inmersiva, personajes memorables y un impresionante nivel de detalle, Red Dead Redemption 2 es aclamado como uno de los mejores juegos de la última década.','https://s1.1zoom.me/big7/565/Red_Dead_Redemption_2_Men_Rifles_Arthur_Morgan_Hat_580584_1920x1080.jpg','Rockstar Games', 4.6, "", 50.46, 18, 6),
('Grand Theft Auto V','Acción/Aventuras',2013,'Playstation/Xbox/Ordenador','Grand Theft Auto V (GTA V) es un juego de acción y aventura desarrollado por Rockstar Games. Ambientado en la ficticia ciudad de Los Santos y sus alrededores, los jugadores asumen el papel de tres protagonistas: Michael, Franklin y Trevor, quienes se involucran en una serie de actividades criminales mientras navegan por el mundo del crimen organizado, la corrupción y la traición. Con su vasto mundo abierto, repleto de misiones, actividades secundarias y un modo multijugador robusto, GTA V ofrece una experiencia de juego dinámica y llena de acción. Desde su lanzamiento en 2013, ha sido uno de los juegos más exitosos y aclamados por la crítica de todos los tiempos.','https://i.pinimg.com/originals/b3/41/0a/b3410a93baab7154a78187222b753f27.jpg','Rockstar Games', 4.5, "gta5", 15, 60,7),
('Fall Guys','Battle Royale',2020,'Nintendo Switch/Playstation/Ordenador/Xbox','Fall Guys: Ultimate Knockout es un juego de tipo battle royale desarrollado por Mediatonic. En él, hasta 60 jugadores controlan adorables personajes llamados "Fall Guys" en una serie de desafiantes pruebas y obstáculos en una competencia estilo juego de televisión. Los jugadores deben superar diversos obstáculos, competir en mini-juegos y evitar caer en eliminaciones hasta que solo quede un ganador. Con su diseño colorido, mecánicas simples pero divertidas, y la emoción de la competencia multijugador, Fall Guys ha ganado popularidad como un juego socialmente divertido y accesible para jugadores de todas las edades.','https://images6.alphacoders.com/125/1250786.jpg','Mediatonic', 4.75, "", 10.98, 33, 8),
('Dark Souls III','Rol',2016,'Xbox/Playstation/Ordenador','Dark Souls 3 es un desafiante juego de rol de acción desarrollado por FromSoftware. Situado en un oscuro y desolado mundo de fantasía, los jugadores asumen el papel de un no muerto que se aventura a través de peligrosas tierras en busca de la salvación. Con combates intensos y estratégicos, un mundo interconectado lleno de secretos y una atmósfera opresiva, Dark Souls 3 ofrece una experiencia inmersiva y desafiante. La habilidad del jugador para aprender y adaptarse es fundamental para sobrevivir en este mundo brutal y hostil. Desde su lanzamiento, ha sido elogiado por su diseño de niveles ingenioso, su jugabilidad satisfactoria y su narrativa ambiental profunda.','https://images3.alphacoders.com/600/600925.jpg','FromSoftware', 4.5, "", 14.58, 55, 9),
('Sea of Thieves','Acción/Aventuras',2018,'Playstation/Xbox/Ordenador','Sea of Thieves es un juego de aventuras en línea desarrollado por Rare Ltd. En él, los jugadores asumen el papel de piratas que navegan por un vasto mundo abierto lleno de islas exóticas, tesoros ocultos y peligrosos enemigos. Ya sea explorando islas misteriosas, enfrentándose a otros jugadores en batallas navales o buscando tesoros enterrados, la cooperación en equipo y la comunicación son clave para el éxito. Con su estilo visual único y su enfoque en la libertad de juego, Sea of Thieves ofrece una experiencia de piratería llena de diversión y aventura para jugadores de todas las edades.','https://sm.ign.com/ign_es/screenshot/default/3b9907bf-92ef-46e4-9a02-ecbd453252cc_qw3c.jpg','Rare', 4.5, "", 34.95, 20, 10),
('Dead by Daylight', 'Survival horror', 2016, 'Ordenador/Playstation/Nintendo Switch', 'Dead by Daylight es un videojuego de terror multijugador asimétrico en el que cuatro jugadores controlan a supervivientes y deben escapar de un asesino, mientras que un jugador asume el papel del asesino y trata de capturar y sacrificar a los supervivientes. Los supervivientes deben completar una serie de generadores para abrir las puertas de escape, mientras evitan ser capturados y sacrificados por el asesino en un entorno oscuro y peligroso. Con una atmósfera tensa y emocionante, "Dead by Daylight" ofrece una experiencia de juego única y llena de adrenalina tanto para los jugadores de supervivientes como para el asesino.', 'https://images4.alphacoders.com/133/1334860.jpeg', 'Behaviour Interactive', 3.5, "dbd", 12.10, 10, 11),
('Fórmula 1 2024', 'Simulación', 2024, 'Ordenador/Playstation', 'En el juego de Fórmula 1 2024, los jugadores experimentan la emoción de la competición de élite con gráficos de vanguardia y una jugabilidad mejorada. Puedes competir como tus pilotos favoritos o crear tu propio equipo, gestionando todo, desde el desarrollo del coche hasta las estrategias de carrera. Sumérgete en la acción de las carreras más emocionantes del mundo y conquista el campeonato.', 'https://areajugones.sport.es/wp-content/uploads/2024/04/f1-24.jpg', 'Codemasters', 4, "f1", 69.99, 33, 12);

-- Inserciones de la tabla comentariosJuegos
INSERT INTO comentariosJuegos (comentario, juegoId, userId) VALUES
('Un xogo donde hai mais inters que personas', 1, 1),
('Matante correndo',2,2),
('Perfecto jueguito cando javier ta pesado',3,3),
('Mellor serie non pode existir neste planeta',4,4),
('Xoguiño de elevada dificultade',5,5),
('IDK',6,6),
('Ladron promedio = ekko',7,7),
('Tipos caendo',8,8),
('Terceiras sombras mas oscuras',9,9),
('O mare dos piratas',10,10),
('É un xogazo', 11, 1),
('Está Fernando Alonso, padre. ¿Qué máis queres?', 12, 4);

-- Inserciones de la tabla favoritos
INSERT INTO favoritos (juegoId, userId, esFavorito) VALUES 
(1, 1, true),
(2, 2, true),
(3, 3, true),
(4, 4, true),
(5, 5, true),
(6, 6, true),
(7, 7, true),
(8, 8, true),
(9, 9, true),
(10, 10, true),
(11, 1, true),
(12, 7, true);

-- Inserciones de la tabla plataformasJuegos
INSERT INTO plataformasJuegos (nombre, juegoId) VALUES 
('Indie', 1),
('Indie', 2),
('Steam', 3),
('Level-5', 4),
('Steam', 5),
('Rockstar Games', 6),
('Rockstar Games', 7),
('Epic Games', 8),
('Steam', 9),
('Steam', 10),
('Steam', 11),
('Steam', 12);

/*Ahora añadimos todas las claves foráneas correspondientes para el proyecto de NexoGamer*/

/*USERS*/
ALTER TABLE users ADD FOREIGN KEY (juegoFavoritoId) REFERENCES favoritos(id);
ALTER TABLE users ADD FOREIGN KEY (comentarioJuegoId) REFERENCES comentariosJuegos(id);

/*JUEGOS*/
ALTER TABLE juegos ADD FOREIGN KEY (comentarioId) REFERENCES comentariosJuegos(id);

/*COMENTARIOS JUEGOS*/
ALTER TABLE comentariosJuegos ADD FOREIGN KEY (juegoId) REFERENCES juegos(id);
ALTER TABLE comentariosJuegos ADD FOREIGN KEY (userId) REFERENCES users(id);

/*FAVORITOS*/
ALTER TABLE favoritos ADD FOREIGN KEY (juegoId) REFERENCES juegos(id);
ALTER TABLE favoritos ADD FOREIGN KEY (userId) REFERENCES users(id);

/*PLATAFORMAS JUEGOS*/
ALTER TABLE plataformasJuegos ADD FOREIGN KEY (juegoId) REFERENCES juegos(id);