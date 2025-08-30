CREATE DATABASE Biblioteca;
GO
USE Biblioteca;
GO	

-- Tabla de Libro
CREATE TABLE Libro(
	IdLibro INT PRIMARY KEY IDENTITY(1,1),
	Titulo VARCHAR(100),
	Genero VARCHAR(30),
	Fecha_Creacion DATE,
	Editorial VARCHAR(30),
	Idioma VARCHAR(20),
	IdCategoria INT,  -- Relación con Categoria
	FOREIGN KEY (IdCategoria) REFERENCES Categoria(IdCategoria)
);

-- Tabla de Categoria
CREATE TABLE Categoria(
	IdCategoria INT PRIMARY KEY IDENTITY(1,1),
	Nombre_Categoria VARCHAR(30),
	Tipo_Contenido VARCHAR(20),
	Genero VARCHAR(30)
);

-- Tabla de Autores
CREATE TABLE Autores(
	IdAutor INT PRIMARY KEY IDENTITY(1,1),
	Nombre_Autor VARCHAR(50),
	Nacionalidad VARCHAR(50),
	Descripcion VARCHAR(50)
);

-- Tabla de Usuario
CREATE TABLE Usuarios(
	IdUsuario INT PRIMARY KEY IDENTITY(1,1),
	Nombre_Usuario VARCHAR(50),
	Cedula INT,
	Direccion VARCHAR(100),
	Telefono INT,
	Correo VARCHAR(50),
	Carrera VARCHAR(50)
);

-- Tabla de Biblioteca
CREATE TABLE Biblioteca(
	IdBiblioteca INT PRIMARY KEY IDENTITY(1,1),
	Nombre VARCHAR(100),
	Ciudad VARCHAR(20),
	Direccion VARCHAR(100),
	Telefono INT,
	Seccion VARCHAR(30)
);

-- Tabla de Reservas
CREATE TABLE Reservas(
	IdReserva INT PRIMARY KEY IDENTITY(1,1),
	Fecha_Salida DATE,
	Fecha_Devolucion DATE,
	IdLibro INT,  -- Relación con Libro
	IdUsuario INT,  -- Relación con Usuario
	Multa FLOAT,
	Estado VARCHAR(20),
	FOREIGN KEY (IdLibro) REFERENCES Libro(IdLibro),
	FOREIGN KEY (IdUsuario) REFERENCES Usuarios(IdUsuario)
);

-- Tabla de Inventario
CREATE TABLE Inventario(
	IdInventario INT PRIMARY KEY IDENTITY(1,1),
	Cantidad INT,
	IdLibro INT,  -- Relación con Libro
	IdBiblioteca INT,  -- Relación con Biblioteca
	Estado VARCHAR(20),
	FOREIGN KEY (IdLibro) REFERENCES Libro(IdLibro),
	FOREIGN KEY (IdBiblioteca) REFERENCES Biblioteca(IdBiblioteca)
);

-- Relación muchos a muchos entre Libro y Autores
CREATE TABLE Libro_Autores(
	IdLibro INT,
	IdAutor INT,
	PRIMARY KEY (IdLibro, IdAutor),
	FOREIGN KEY (IdLibro) REFERENCES Libro(IdLibro),
	FOREIGN KEY (IdAutor) REFERENCES Autores(IdAutor)
);
