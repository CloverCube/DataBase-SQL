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
('videojuego');

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
    FOREIGN KEY (TipoID) REFERENCES TiposContenido(TipoID),
    FOREIGN KEY (GeneroID) REFERENCES Generos(GeneroID)
);

INSERT INTO Contenidos (Titulo, Descripcion, FechaLanzamiento, TipoID, GeneroID) VALUES
('Inception', 'Un ladrón que roba secretos corporativos a través del uso de la tecnología de sueño compartido.', '2010-07-16', 1, 3),
('The Dark Knight', 'Batman lucha contra el crimen organizado y el Joker.', '2008-07-18', 1, 1),
('Interstellar', 'Un grupo de astronautas viaja a través de un agujero de gusano para encontrar un nuevo hogar para la humanidad.', '2014-11-07', 1, 3),
('Titanic', 'Una historia de amor trágica durante el hundimiento del Titanic.', '1997-12-19', 1, 7),
('Coco', 'Un niño se embarca en una aventura en la Tierra de los Muertos para descubrir la historia de su familia.', '2017-10-27', 1, 10);

INSERT INTO Contenidos (Titulo, Descripcion, FechaLanzamiento, TipoID, GeneroID) VALUES
('The Legend of Zelda: Breath of the Wild', 'Un juego de mundo abierto donde Link debe derrotar a Ganon y salvar Hyrule.', '2017-03-03', 2, 2),
('God of War', 'Kratos viaja con su hijo por tierras nórdicas enfrentando criaturas mitológicas.', '2018-04-20', 2, 1),
('The Last of Us Part II', 'Una historia de supervivencia en un mundo postapocalíptico.', '2020-06-19', 2, 4),
('Minecraft', 'Un juego de construcción y supervivencia en un mundo de bloques.', '2011-11-18', 2, 19),
('Hollow Knight', 'Un metroidvania 2D donde un caballero lucha por restaurar su reino.', '2017-02-24', 2, 20);

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
VALUES ('cliente', 'cliente@pixel.com', 'cliente123', 0);

CREATE USER PixelUser FOR LOGIN PixelUser;
EXEC sp_addrolemember 'db_owner', 'PixelUser';

-- ALTER TABLE Resenas
-- ADD Likes INT NOT NULL DEFAULT 0;

-- UPDATE Contenidos
-- SET Titulo = 'Batman vs Joker'
-- WHERE Titulo = 'The Dark Knight';
