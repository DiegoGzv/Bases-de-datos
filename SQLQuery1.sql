CREATE DATABASE Biblioteca;
GO
USE Biblioteca;
GO	
CREATE TABLE Libro(
	IdLibro INT PRIMARY KEY IDENTITY(1,1) ,
	Titulo VARCHAR(100),
	Genero VARCHAR(30),
	Fecha_Creacion DATE,
	Editorial VARCHAR(30),
	Idioma VARCHAR(20)
);

CREATE TABLE Categoria(
	IdCategoria INT PRIMARY KEY IDENTITY(1,1),
	Nombre_Categoria VARCHAR(30),
	Tipo_Contenido VARCHAR(20),
	Genero VARCHAR(30)
);

CREATE TABLE Autores(
	IdAutor INT PRIMARY KEY IDENTITY(1,1),
	Nombre_Autor VARCHAR(50),
	Nacioanlidad VARCHAR(50),
	Descripcion VARCHAR(50)
);

CREATE TABLE Usuarios(
	IdUsuario INT PRIMARY KEY IDENTITY(1,1),
	Nombre_Usuario VARCHAR (50),
	Cedula INT,
	Direccion VARCHAR (100),
	Telefono INT,
	Correo VARCHAR (50),
	Carrera VARCHAR (50)
);

CREATE TABLE Biblioteca(
	IdBiblioteca INT PRIMARY KEY IDENTITY(1,1),
	Nombre VARCHAR (100),
	Ciuda VARCHAR (20),
	Direccion VARCHAR (100),
	Telefono INT,
	Seccion VARCHAR (30),
);

CREATE TABLE Reservas(
	IdReserva INT PRIMARY KEY IDENTITY(1,1),	
	Fecha_Salida date,
	Fecha_Devolucion date,
	Libro_Reservado VARCHAR (30),
	Usuario_Prestado INT FOREIGN KEY REFERENCES Usuarios(IdUsuario),
	Multa float, 
	Estado VARCHAR(20),
);

CREATE TABLE Inventario(
	IdInventario INT PRIMARY KEY IDENTITY(1,1),
	Cantidad int,
	Libro int, 
	Estado VARCHAR(20),
);
