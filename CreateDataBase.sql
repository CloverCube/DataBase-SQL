CREATE DATABASE PixelFrame;
GO

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

CREATE TABLE Generos (
    GeneroID INT PRIMARY KEY IDENTITY(1,1),
    NombreGenero NVARCHAR(50) NOT NULL UNIQUE
);

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

CREATE TABLE Resenas (
    ReseñaID INT PRIMARY KEY IDENTITY(1,1),
    UsuarioID INT NOT NULL,
    ContenidoID INT NOT NULL,
    Calificacion INT NOT NULL CHECK (Calificacion BETWEEN 1 AND 10),
    Comentario NVARCHAR(MAX),
    FechaReseña DATETIME DEFAULT GETDATE(),
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
