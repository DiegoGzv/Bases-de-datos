--CREATE DATABASE Biblioteca;
GO
USE Biblioteca;
GO	
CREATE TABLE Libros(
	IdLibro INT PRIMARY KEY IDENTITY(1,1) ,
	Titulo VARCHAR(100),
	Genero VARCHAR(30),
	Fecha_Creacion DATE,
	Editorial VARCHAR(30),
	Idioma VARCHAR(20)
);

CREATE TABLE Categorias(
	IdCategoria INT PRIMARY KEY IDENTITY(1,1),
	Nombre VARCHAR(30),
	Tipo VARCHAR(20),
	Contenido VARCHAR(20),
	Genero VARCHAR(30)
);
