CREATE DATABASE Biblioteca; 
GO 
USE Biblioteca; 
GO

-- 1. Tablas que no dependen de nadie
CREATE TABLE Usuarios(
	IdUsuario INT PRIMARY KEY IDENTITY(1,1), 
	Nombre_Usuario VARCHAR (50), 
	Cedula INT, 
	Direccion VARCHAR (100), 
	Telefono INT, 
	Correo VARCHAR (50), 
	Carrera VARCHAR (50) 
); 

CREATE TABLE Autores( 
	IdAutor INT PRIMARY KEY IDENTITY(1,1), 
	Nombre_Autor VARCHAR(50), 
	Nacionalidad VARCHAR(50), 
	Descripcion VARCHAR(50)
); 

CREATE TABLE Categoria(
	IdCategoria INT PRIMARY KEY IDENTITY(1,1), 
	Nombre_Categoria VARCHAR(30), 
	Tipo_Contenido VARCHAR(20), 
	Genero VARCHAR(30)
); 

CREATE TABLE Biblioteca(
	IdBiblioteca INT PRIMARY KEY IDENTITY(1,1), 
	Nombre VARCHAR (100), 
	Ciuda VARCHAR (20), 
	Direccion VARCHAR (100), 
	Telefono INT, 
	Seccion VARCHAR (30)
); 

-- 2. Tabla Libro (depende de Autores, Categoria y Biblioteca)
CREATE TABLE Libro(
	IdLibro INT PRIMARY KEY IDENTITY(1,1), 
	Titulo VARCHAR(100), 
	Genero VARCHAR(30),
	Fecha_Creacion DATE, 
	Editorial VARCHAR(30),
	Idioma VARCHAR(20),
	IdAutorFK INT NOT NULL,
	IdBibliotecaFK INT NOT NULL,
	IdCategoriaFK INT NOT NULL,

	CONSTRAINT FK_Libro_Autor FOREIGN KEY (IdAutorFK) REFERENCES Autores(IdAutor),
	CONSTRAINT FK_Libro_Categoria FOREIGN KEY (IdCategoriaFK) REFERENCES Categoria(IdCategoria),
	CONSTRAINT FK_Libro_Biblioteca FOREIGN KEY (IdBibliotecaFK) REFERENCES Biblioteca(IdBiblioteca),
);

-- 3. Tabla Inventario (depende de Libro)
CREATE TABLE Inventario( 
	IdInventario INT PRIMARY KEY IDENTITY(1,1), 
	Cantidad INT, 
	Libro INT, 
	Estado VARCHAR(20),
	IdLibroFK INT NOT NULL,

	CONSTRAINT FK_Inventario_Libro FOREIGN KEY (IdLibroFK) REFERENCES Libro(IdLibro)
);

-- 4. Tabla Reservas (depende de Libro y Usuarios)
CREATE TABLE Reservas( 
	IdReserva INT PRIMARY KEY IDENTITY(1,1), 
	Fecha_Salida DATE, 
	Fecha_Devolucion DATE, 
	Libro_Reservado VARCHAR (30), 
	Usuario_Prestado INT, 
	Multa FLOAT, 
	Estado VARCHAR(20),
	IdUsuarioFK INT NOT NULL,
	IdLibroFK INT NOT NULL,

	CONSTRAINT FK_Reserva_Libro FOREIGN KEY (IdLibroFK) REFERENCES Libro(IdLibro),
	CONSTRAINT FK_Reserva_Usuarios FOREIGN KEY (IdUsuarioFK) REFERENCES Usuarios(IdUsuario)
); 

CREATE TABLE Libro_Autor(
	IdLibroAutor INT PRIMARY KEY IDENTITY(1,1),
	IdLibroFK INT NOT NULL,
	IdAutorFK INT NOT NULL,

	CONSTRAINT FK_LibroAutor_Libro FOREIGN KEY (IdLibroFK) REFERENCES Libro(IdLibro),
	CONSTRAINT FK_LibroAutore_Autor FOREIGN KEY (IdAutorFK) REFERENCES Autores(IdAutor),
);
