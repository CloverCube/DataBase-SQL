CREATE DATABASE PixelFrame;
GO

CREATE LOGIN PixelUser WITH PASSWORD = 'Hola123!Segura';

USE PixelFrame;
GO

CREATE TABLE Usuarios (
    UsuarioID INT PRIMARY KEY IDENTITY(1,1),
    NombreUsuario NVARCHAR(50) NOT NULL UNIQUE,
    Correo NVARCHAR(100) NOT NULL UNIQUE,
    Contrasena NVARCHAR(255) NOT NULL,
    EsAdmin BIT NOT NULL DEFAULT 0,
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE TiposContenido (
    TipoID INT PRIMARY KEY IDENTITY(1,1),
    NombreTipo NVARCHAR(20) NOT NULL UNIQUE
);

INSERT INTO TiposContenido (NombreTipo) VALUES
('pelicula'),
('videojuego'),
('serie');

CREATE TABLE Generos (
    GeneroID INT PRIMARY KEY IDENTITY(1,1),
    NombreGenero NVARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO Generos (NombreGenero) VALUES
('Accion'),
('Aventura'),
('Ciencia Ficcion'),
('Drama'),
('Comedia'),
('Terror'),
('Romance'),
('Fantasía'),
('Documental'),
('Animación'),
('Misterio'),
('Musical'),
('Deportes'),
('Superhéroes'),
('Survival Horror'),
('Shooter'),
('Rol'),
('Estrategia'),
('Sandbox'),
('Indie');

CREATE TABLE Contenidos (
    ContenidoID INT PRIMARY KEY IDENTITY(1,1),
    Titulo NVARCHAR(100) NOT NULL,
    Descripcion NVARCHAR(MAX),
    FechaLanzamiento DATE,
    TipoID INT NOT NULL,
    GeneroID INT NOT NULL,
	Likes INT NOT NULL DEFAULT 0,
    FOREIGN KEY (TipoID) REFERENCES TiposContenido(TipoID),
    FOREIGN KEY (GeneroID) REFERENCES Generos(GeneroID)
);

-- Peliculas
INSERT INTO Contenidos (Titulo, Descripcion, FechaLanzamiento, TipoID, GeneroID, Likes) VALUES
('Inception', 'Un ladrón que roba secretos corporativos a través del uso de la tecnología de sueño compartido.', '2010-07-16', 1, 3, 152),
('The Dark Knight', 'Batman lucha contra el crimen organizado y el Joker.', '2008-07-18', 1, 1, 214),
('Interstellar', 'Un grupo de astronautas viaja a través de un agujero de gusano para encontrar un nuevo hogar para la humanidad.', '2014-11-07', 1, 3, 178),
('Titanic', 'Una historia de amor trágica durante el hundimiento del Titanic.', '1997-12-19', 1, 7, 245),
('Coco', 'Un niño se embarca en una aventura en la Tierra de los Muertos para descubrir la historia de su familia.', '2017-10-27', 1, 10, 198),
('The Matrix', 'Un hacker descubre la verdadera naturaleza de su realidad.', '1999-03-31', 1, 3, 331),
('Avengers: Endgame', 'Los Vengadores reúnen fuerzas para revertir el chasquido de Thanos.', '2019-04-26', 1, 13, 299),
('Pulp Fiction', 'Historias entrelazadas del bajo mundo de Los Ángeles.', '1994-10-14', 1, 1, 267),
('The Godfather', 'La saga de la familia mafiosa Corleone.', '1972-03-24', 1, 4, 415),
('Forrest Gump', 'La historia de un hombre con un gran corazón a través de décadas de historia americana.', '1994-07-06', 1, 4, 193),
('Parasite', 'Una crítica social entre clases en Corea del Sur.', '2019-05-30', 1, 4, 222),
('Joker', 'Un hombre marginado se convierte en un símbolo de caos.', '2019-10-04', 1, 4, 301),
('The Shawshank Redemption', 'Dos reclusos forman una amistad profunda en prisión.', '1994-09-23', 1, 4, 190),
('Gladiator', 'Un general romano se convierte en gladiador para vengar a su familia.', '2000-05-05', 1, 1, 278),
('Toy Story', 'Los juguetes cobran vida cuando los humanos no están presentes.', '1995-11-22', 1, 10, 160),
('Up', 'Un anciano viaja en su casa voladora para cumplir el sueño de su esposa.', '2009-05-29', 1, 10, 147),
('La La Land', 'Una historia de amor entre un pianista y una actriz en Los Ángeles.', '2016-12-09', 1, 12, 203),
('Black Panther', 'El príncipe de Wakanda lucha por proteger su reino.', '2018-02-16', 1, 13, 342),
('The Silence of the Lambs', 'Una agente del FBI entrevista a un asesino para atrapar a otro.', '1991-02-14', 1, 11, 220),
('Spirited Away', 'Una niña entra en un mundo mágico para salvar a sus padres.', '2001-07-20', 1, 8, 410);

-- Juegos
INSERT INTO Contenidos (Titulo, Descripcion, FechaLanzamiento, TipoID, GeneroID, Likes) VALUES
('The Legend of Zelda: Breath of the Wild', 'Un juego de mundo abierto donde Link debe derrotar a Ganon y salvar Hyrule.', '2017-03-03', 2, 2, 359),
('God of War', 'Kratos viaja con su hijo por tierras nórdicas enfrentando criaturas mitológicas.', '2018-04-20', 2, 1, 174),
('The Last of Us Part II', 'Una historia de supervivencia en un mundo postapocalíptico.', '2020-06-19', 2, 4, 206),
('Minecraft', 'Un juego de construcción y supervivencia en un mundo de bloques.', '2011-11-18', 2, 19, 115),
('Hollow Knight', 'Un metroidvania 2D donde un caballero lucha por restaurar su reino.', '2017-02-24', 2, 20, 275),
('Red Dead Redemption 2', 'Un forajido lucha por sobrevivir en el viejo oeste.', '2018-10-26', 2, 2, 398),
('Elden Ring', 'Un mundo abierto lleno de misterio y combate desafiante.', '2022-02-25', 2, 17, 385),
('Portal 2', 'Resuelve acertijos usando portales en un laboratorio.', '2011-04-19', 2, 18, 260),
('Overwatch', 'Shooter en equipo con héroes únicos.', '2016-05-24', 2, 16, 310),
('League of Legends', 'Juego competitivo de estrategia en equipos.', '2009-10-27', 2, 18, 490),
('Stardew Valley', 'Administra una granja y haz amigos en un pueblo encantador.', '2016-02-26', 2, 20, 370),
('Undertale', 'Un RPG donde las decisiones morales importan.', '2015-09-15', 2, 20, 342),
('Hades', 'Escapa del inframundo en este roguelike aclamado.', '2020-09-17', 2, 1, 228),
('Valorant', 'FPS táctico por equipos.', '2020-06-02', 2, 16, 355),
('Resident Evil 4', 'Un agente debe rescatar a la hija del presidente de una secta.', '2005-01-11', 2, 15, 322),
('Dark Souls III', 'Un mundo oscuro donde cada paso cuenta.', '2016-03-24', 2, 17, 289),
('Celeste', 'Una joven escala una montaña mientras enfrenta sus miedos.', '2018-01-25', 2, 20, 301),
('The Witcher 3: Wild Hunt', 'Un cazador de monstruos busca a su hija adoptiva.', '2015-05-19', 2, 17, 410),
('Among Us', 'Identifica al impostor en una nave espacial.', '2018-06-15', 2, 20, 440),
('Fortnite', 'Juego de battle royale multijugador.', '2017-07-21', 2, 18, 470);

--Series
INSERT INTO Contenidos (Titulo, Descripcion, FechaLanzamiento, TipoID, GeneroID, Likes) VALUES
('Breaking Bad', 'Un profesor de química se convierte en narcotraficante.', '2008-01-20', 3, 4, 231),
('Game of Thrones', 'Nobles luchan por el control del Trono de Hierro.', '2011-04-17', 3, 8, 453),
('Stranger Things', 'Niños enfrentan criaturas de otra dimensión.', '2016-07-15', 3, 3, 98),
('The Office', 'Una mirada cómica a la vida en una oficina.', '2005-03-24', 3, 5, 124),
('Friends', 'Un grupo de amigos navega por la vida en Nueva York.', '1994-09-22', 3, 5, 531),
('The Mandalorian', 'Un cazarrecompensas viaja por la galaxia.', '2019-11-12', 3, 8, 842),
('Sherlock', 'Moderna interpretación del famoso detective.', '2010-07-25', 3, 11, 423),
('The Crown', 'Relato biográfico del reinado de Isabel II.', '2016-11-04', 3, 4, 432),
('Better Call Saul', 'La historia previa de un abogado poco ético.', '2015-02-08', 3, 4, 543),
('Black Mirror', 'Historias de ciencia ficción sobre tecnología.', '2011-12-04', 3, 3, 324),
('Avatar: The Last Airbender', 'Un joven debe dominar los elementos para salvar al mundo.', '2005-02-21', 3, 8, 423),
('BoJack Horseman', 'Un actor deprimido intenta reconectarse con la vida.', '2014-08-22', 3, 5, 82),
('Rick and Morty', 'Un científico loco y su nieto viven aventuras multidimensionales.', '2013-12-02', 3, 3, 98),
('The Boys', 'Un grupo de vigilantes enfrenta a superhéroes corruptos.', '2019-07-26', 3, 13, 99),
('Chernobyl', 'La historia del desastre nuclear.', '2019-05-06', 3, 9, 111);

CREATE TABLE Resenas (
    ReseñaID INT PRIMARY KEY IDENTITY(1,1),
    UsuarioID INT NOT NULL,
    ContenidoID INT NOT NULL,
    Calificacion INT NOT NULL CHECK (Calificacion BETWEEN 1 AND 10),
    Comentario NVARCHAR(MAX),
    FechaReseña DATETIME DEFAULT GETDATE(),
	Likes INT NOT NULL DEFAULT 0,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID),
    FOREIGN KEY (ContenidoID) REFERENCES Contenidos(ContenidoID)
);

CREATE TABLE Favoritos (
    FavoritoID INT PRIMARY KEY IDENTITY(1,1),
    UsuarioID INT NOT NULL,
    ContenidoID INT NOT NULL,
    FechaAgregado DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID),
    FOREIGN KEY (ContenidoID) REFERENCES Contenidos(ContenidoID),
    UNIQUE (UsuarioID, ContenidoID)
);

CREATE TABLE HistorialPaginas (
    HistorialID INT PRIMARY KEY IDENTITY(1,1),
    UsuarioID INT NOT NULL,
    ContenidoID INT NOT NULL,
    FechaVisita DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID),
    FOREIGN KEY (ContenidoID) REFERENCES Contenidos(ContenidoID)
);

INSERT INTO Usuarios (NombreUsuario, Correo, Contrasena, EsAdmin)
VALUES ('admin', 'admin@pixel.com', 'admin123', 1);

INSERT INTO Usuarios (NombreUsuario, Correo, Contrasena, EsAdmin)
VALUES ('cliente', 'cliente@pixel.com', 'cliente123', 0),
('lucas98', 'lucas98@mail.com', 'clave123', 0),
('mariaG', 'maria.garcia@mail.com', 'password456', 0),
('juanjose', 'juan.jose@mail.com', 'mipass789', 0),
('carlaR', 'carla.rosales@mail.com', 'secreto321', 0),
('tomasx', 'tomas.x@mail.com', 'xtomas2024', 0),
('andrews', 'andrew_smith@mail.com', 'smithpass1', 0),
('valeriaV', 'valeria@mail.com', 'vvaleria234', 0),
('fernan22', 'fernando@mail.com', '123fer22', 0),
('noeliaR', 'noelia.r@mail.com', 'noelia12!', 0),
('josephQ', 'joseph.q@mail.com', 'joQsecure', 0),
('daniH', 'daniela.h@mail.com', 'dan1234', 0),
('alvaroS', 'alvaro.s@mail.com', 'passalv!', 0),
('luisaM', 'luisa@mail.com', 'luisa321', 0),
('kevinR', 'kevin.r@mail.com', 'krpass123', 0),
('melanyZ', 'melanyz@mail.com', 'melzpass', 0);

INSERT INTO Favoritos (UsuarioID, ContenidoID) VALUES
(2, 1), (2, 2), (2, 16),
(7, 5), (7, 14),
(8, 16), (8, 17), (8, 6),
(9, 11), (9, 12),
(10, 36), (10, 40),
(11, 2), (11, 19), (11, 20),
(12, 3), (12, 1),
(13, 16),
(14, 33), (14, 30),
(15, 25), (15, 27),
(16, 6), (16, 8),
(17, 15), (17, 13);

INSERT INTO HistorialPaginas (UsuarioID, ContenidoID) VALUES
(2, 1), (2, 16), (2, 36),
(7, 5), (7, 6), (7, 40),
(8, 6), (8, 7), (8, 41),
(9, 11), (9, 16),
(10, 30), (10, 26),
(11, 19), (11, 20), (11, 2),
(12, 3), (12, 16),
(13, 10), (13, 11),
(14, 30), (14, 33),
(15, 25), (15, 44),
(16, 6), (16, 7), (16, 8),
(17, 13), (17, 12);

INSERT INTO Resenas (UsuarioID, ContenidoID, Calificacion, Comentario) VALUES
(2, 1, 9, 'Excelente trama y efectos especiales.'),
(2, 16, 10, 'Una obra maestra del cine coreano.'),
(7, 5, 8, 'Muy emotiva y con excelente animación.'),
(8, 6, 9, 'Increíble mundo abierto y exploración.'),
(9, 11, 7, 'Interesante historia pero algo confusa.'),
(10, 36, 10, 'Desafiante pero muy gratificante.'),
(11, 29, 8, 'Genial para jugar con amigos.'),
(12, 3, 9, 'Una aventura épica y conmovedora.'),
(13, 10, 10, 'Joya del metroidvania, gran ambientación.'),
(14, 33, 9, 'Acción fluida y diseño brillante.'),
(15, 25, 10, 'Una experiencia mágica y nostálgica.'),
(16, 7, 10, 'Kratos y Atreus brillan en esta historia.'),
(17, 15, 9, 'Tom Hanks en su mejor actuación.'),
(9, 24, 9, 'Tensa e impactante, Hannibal da miedo.'),
(7, 30, 7, 'Competitivo y frustrante, pero adictivo.'),
(8, 38, 10, 'Una de las mejores aventuras RPG.'),
(9, 8, 10, 'Historia emotiva y excelente gameplay.'),
(11, 2, 10, 'Heath Ledger simplemente insuperable.'),
(11, 28, 9, 'Puzles geniales y una historia inesperada.'),
(12, 22, 7, 'Linda historia y canciones pegajosas.'),
(13, 27, 9, 'Difícil pero muy gratificante.'),
(14, 14, 10, 'Un clásico que envejece perfectamente.'),
(15, 39, 6, 'Divertido pero limitado en contenido.'),
(16, 9, 10, 'Creatividad infinita, nunca aburre.'),
(1, 4, 8, 'Buena mezcla de acción y drama.'),
(2, 18, 7, 'Visualmente impactante pero algo lenta.'),
(3, 17, 9, 'Historia cautivadora y bien dirigida.'),
(4, 12, 6, 'Entretenida pero predecible.'),
(5, 21, 9, 'Divertido y fácil de jugar en grupo.'),
(6, 23, 8, 'Buena ambientación y narrativa.'),
(7, 19, 10, 'Impresionante desde el inicio hasta el final.'),
(8, 13, 9, 'Gran homenaje a los clásicos.'),
(9, 20, 6, 'Mecánicas interesantes pero repetitivas.'),
(10, 26, 10, 'Una montaña rusa emocional.'),
(11, 31, 7, 'Rejugable y entretenido, pero con bugs.'),
(12, 35, 8, 'Estilo artístico único y buen ritmo.'),
(13, 32, 9, 'Música envolvente y diseño original.'),
(14, 40, 10, 'Una obra que redefine el género.'),
(15, 34, 9, 'Guion sólido y personajes memorables.'),
(16, 37, 7, 'Cumple pero no innova.'),
(17, 1, 10, 'Una de mis favoritas de todos los tiempos.'),
(1, 3, 9, 'Narrativa brillante y dirección impecable.'),
(2, 6, 8, 'Mapa enorme con muchas actividades.'),
(3, 10, 9, 'Cada rincón está lleno de detalles.'),
(4, 11, 8, 'Un giro interesante en la historia.'),
(5, 8, 7, 'Buen desarrollo de personajes.'),
(6, 2, 10, 'Inolvidable de principio a fin.'),
(7, 33, 9, 'Combate pulido y bien balanceado.'),
(8, 5, 8, 'Animación impresionante y banda sonora emotiva.'),
(9, 7, 10, 'Perfecto para los fans de la saga.'),
(10, 9, 9, 'Creatividad desbordante.'),
(11, 15, 10, 'Actuaciones estelares.'),
(12, 16, 9, 'Suspenso bien construido.'),
(13, 12, 7, 'Interesante pero no atrapante.'),
(14, 13, 8, 'Buen ritmo y jugabilidad intuitiva.'),
(15, 27, 10, 'Desafíos que valen la pena.'),
(16, 28, 7, 'Algunos puzles demasiado crípticos.'),
(17, 14, 10, 'Un clásico inmortal.'),
(1, 36, 9, 'Desafiante pero justo.'),
(2, 29, 10, 'Diversión garantizada en modo multijugador.'),
(3, 38, 10, 'Un RPG que todos deben jugar.'),
(4, 39, 7, 'Entretenido aunque repetitivo.'),
(5, 35, 8, 'Estilo artístico que destaca.');

CREATE USER PixelUser FOR LOGIN PixelUser;
EXEC sp_addrolemember 'db_owner', 'PixelUser';

SELECT * FROM Resenas

SELECT UsuarioID, NombreUsuario FROM Usuarios ORDER BY UsuarioID;

-- ALTER TABLE Resenas
-- ADD Likes INT NOT NULL DEFAULT 0;

-- UPDATE Contenidos
-- SET Titulo = 'Batman vs Joker'
-- WHERE Titulo = 'The Dark Knight';

-- SELECT * FROM Usuarios;
-- UPDATE Usuarios SET Correo = ? WHERE UsuarioID = ?

-- INSERT INTO Usuarios (NombreUsuario, Correo, Contrasena) VALUES ('jose123', 'jose@example.com', 'secreta123');

-- SELECT C.ContenidoID, C.Titulo, C.FechaLanzamiento, T.NombreTipo, G.NombreGenero FROM Contenidos C JOIN TiposContenido T ON C.TipoID = T.TipoID JOIN Generos G ON C.GeneroID = G.GeneroID;

-- INSERT INTO Resenas (UsuarioID, ContenidoID, Calificacion, Comentario) VALUES (1, 1, 9, 'Muy buena película, recomendada.');

-- INSERT INTO Resenas (UsuarioID, ContenidoID, Calificacion, Comentario) VALUES (1, 1, 9, 'Muy buena película, recomendada.');

-- SELECT R.ReseñaID, U.NombreUsuario, C.Titulo, R.Calificacion, R.Comentario, R.FechaReseña FROM Resenas R JOIN Usuarios U ON R.UsuarioID = U.UsuarioID JOIN Contenidos C ON R.ContenidoID = C.ContenidoID;



-- exit & delete database
USE master;
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'PixelFrame')
BEGIN
    ALTER DATABASE PixelFrame
    SET SINGLE_USER
    WITH ROLLBACK IMMEDIATE;

    DROP DATABASE PixelFrame;
    PRINT 'Base de datos eliminada correctamente.';
END
ELSE
BEGIN
    PRINT 'La base de datos no existe.';
END




-- TOP 5 contenidos con mejor calificacion promedio
SELECT TOP 5 
    C.Titulo, 
    AVG(R.Calificacion) AS PromedioCalificacion, 
    COUNT(R.ReseñaID) AS TotalResenas
FROM Contenidos C
JOIN Resenas R ON C.ContenidoID = R.ContenidoID
GROUP BY C.Titulo
HAVING COUNT(R.ReseñaID) >= 2
ORDER BY PromedioCalificacion DESC;



-- Usuarios con mas de 3 contenidos en favoritos
SELECT U.NombreUsuario, COUNT(F.FavoritoID) AS TotalFavoritos
FROM Usuarios U
JOIN Favoritos F ON U.UsuarioID = F.UsuarioID
GROUP BY U.NombreUsuario
HAVING COUNT(F.FavoritoID) > 2
ORDER BY TotalFavoritos DESC;




-- Ultimos contenidos visitados por cada usuario (una sola visita por usuario)
SELECT U.NombreUsuario, C.Titulo, MAX(H.FechaVisita) AS UltimaVisita
FROM Usuarios U
JOIN HistorialPaginas H ON U.UsuarioID = H.UsuarioID
JOIN Contenidos C ON H.ContenidoID = C.ContenidoID
GROUP BY U.NombreUsuario, C.Titulo
ORDER BY UltimaVisita DESC;




-- Reseñas recientes de la ultima semana
SELECT R.Comentario, R.Calificacion, R.FechaReseña, U.NombreUsuario AS Usuario, C.Titulo
FROM Resenas R
JOIN Usuarios U ON R.UsuarioID = U.UsuarioID
JOIN Contenidos C ON R.ContenidoID = C.ContenidoID
WHERE R.FechaReseña >= DATEADD(DAY, -7, GETDATE())
ORDER BY R.FechaReseña DESC;





-- Contenidos que están en favoritos de más de un usuario
SELECT C.Titulo, COUNT(DISTINCT F.UsuarioID) AS UsuariosQueLoFavoritaron
FROM Contenidos C
JOIN Favoritos F ON C.ContenidoID = F.ContenidoID
GROUP BY C.Titulo
HAVING COUNT(DISTINCT F.UsuarioID) > 1
ORDER BY UsuariosQueLoFavoritaron DESC;





-- Lista completa de reseñas con datos de usuario tipo de contenido y genero
SELECT R.ReseñaID, U.NombreUsuario, C.Titulo, T.NombreTipo, G.NombreGenero,
       R.Calificacion, R.Comentario, R.FechaReseña
FROM Resenas R
JOIN Usuarios U ON R.UsuarioID = U.UsuarioID
JOIN Contenidos C ON R.ContenidoID = C.ContenidoID
JOIN TiposContenido T ON C.TipoID = T.TipoID
JOIN Generos G ON C.GeneroID = G.GeneroID
ORDER BY R.FechaReseña DESC;




-- Cantidad de visitas por contenido
SELECT C.Titulo, COUNT(H.HistorialID) AS VisitasTotales
FROM Contenidos C
JOIN HistorialPaginas H ON C.ContenidoID = H.ContenidoID
GROUP BY C.Titulo
ORDER BY VisitasTotales DESC;




-- Usuarios que han hecho al menos una reseña y han marcado al menos un contenido como favorito
SELECT U.NombreUsuario
FROM Usuarios U
WHERE EXISTS (
    SELECT 1 FROM Resenas R WHERE R.UsuarioID = U.UsuarioID
)
AND EXISTS (
    SELECT 1 FROM Favoritos F WHERE F.UsuarioID = U.UsuarioID
);




-- Promedio de calificaciones por género
SELECT G.NombreGenero, AVG(R.Calificacion) AS Promedio
FROM Resenas R
JOIN Contenidos C ON R.ContenidoID = C.ContenidoID
JOIN Generos G ON C.GeneroID = G.GeneroID
GROUP BY G.NombreGenero
ORDER BY Promedio DESC;
