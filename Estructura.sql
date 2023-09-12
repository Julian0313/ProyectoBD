CREATE DATABASE TiendaBdd
GO

USE TiendaBdd
GO

CREATE TABLE estado(
	id_estado BIT PRIMARY KEY
	,nombre VARCHAR(50) NOT NULL
	);

CREATE TABLE modulo (
    id_modulo INT PRIMARY KEY
    ,nombre VARCHAR(50) NOT NULL
);

CREATE TABLE permisos(
	id_permiso INT PRIMARY KEY
	,nombre VARCHAR(50) NOT NULL
	,fk_id_modulo INT FOREIGN KEY (fk_id_modulo) REFERENCES modulo(id_modulo)
	);

CREATE TABLE rol(
	id_rol INT IDENTITY(1, 1) PRIMARY KEY
	,nombre VARCHAR(50) NOT NULL
	,fk_id_estado BIT FOREIGN KEY (fk_id_estado) REFERENCES estado(id_estado)
	);

CREATE TABLE panel(
	id_panel INT IDENTITY(1, 1) PRIMARY KEY
	,nombre VARCHAR(100) NOT NULL
	,fk_id_modulo INT FOREIGN KEY (fk_id_modulo) REFERENCES modulo(id_modulo)
	,fk_id_estado BIT FOREIGN KEY (fk_id_estado) REFERENCES estado(id_estado)
);

CREATE TABLE permisos_panel(
	id_permisos_panel INT IDENTITY(1, 1) PRIMARY KEY
	,fk_id_rol INT FOREIGN KEY (fk_id_rol) REFERENCES rol(id_rol)
	,fk_id_modulo INT FOREIGN KEY (fk_id_modulo) REFERENCES modulo(id_modulo)
	,fk_id_panel INT FOREIGN KEY (fk_id_panel) REFERENCES panel(id_panel)
	,fk_id_estado BIT FOREIGN KEY (fk_id_estado) REFERENCES estado(id_estado)
);

CREATE TABLE permisos_rol(
	id_rol_permiso INT IDENTITY(1, 1) PRIMARY KEY
	,fk_id_rol INT FOREIGN KEY (fk_id_rol) REFERENCES rol(id_rol)
	,fk_id_permiso INT FOREIGN KEY (fk_id_permiso) REFERENCES permisos(id_permiso)
	,fk_id_modulo INT FOREIGN KEY (fk_id_modulo) REFERENCES modulo(id_modulo)
	,crear BIT 
	,leer BIT 
	,actualizar BIT 
	,borrar BIT
	);

CREATE TABLE permisos_ususario(	
	id_permisos_ususario INT IDENTITY(1, 1) PRIMARY KEY
	,fk_id_modulo INT FOREIGN KEY (fk_id_modulo) REFERENCES modulo(id_modulo)
	,fk_id_permiso INT FOREIGN KEY (fk_id_permiso) REFERENCES permisos(id_permiso)
	,fk_id_estado BIT FOREIGN KEY (fk_id_estado) REFERENCES estado(id_estado)
);

CREATE TABLE usuario (
    id_usuario INT IDENTITY(1, 1) PRIMARY KEY
    ,usuario VARCHAR(50) NOT NULL
    ,contrasena VARCHAR(50) NOT NULL
	,segundo_factor BIT NOT NULL
	,mostrar_segundo_fa BIT NOT NULL
	,intento INT NOT NULL
	,bloqueo BIT NOT NULL
	,fecha_bloqueo DATETIME NOT NULL
    ,fecha_creacion DATETIME NOT NULL
    ,fecha_modificacion DATETIME NULL
    ,fk_id_rol INT FOREIGN KEY (fk_id_rol) REFERENCES rol(id_rol)
    ,fk_id_estado BIT FOREIGN KEY (fk_id_estado) REFERENCES estado(id_estado)
);

CREATE TABLE historico_contrasena(
	id_historico INT IDENTITY(1, 1) PRIMARY KEY
	,contrasena VARCHAR(50) NOT NULL
	,fecha DATETIME NULL
	,fk_id_usuario INT FOREIGN KEY (fk_id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE persona (
    id_persona INT IDENTITY(1, 1) PRIMARY KEY
    ,identificacion VARCHAR(15) NOT NULL
    ,primer_nombre VARCHAR(20) NOT NULL
    ,segundo_nombre VARCHAR(20)
    ,primer_apellido VARCHAR(20) NOT NULL
    ,segundo_apellido VARCHAR(20)
    ,email VARCHAR(50) NOT NULL
    ,direccion VARCHAR(50) NOT NULL
    ,celular VARCHAR(20) NOT NULL
    ,fecha_creacion DATETIME NULL
    ,fecha_modificacion DATETIME NULL
    ,fk_id_estado BIT FOREIGN KEY (fk_id_estado) REFERENCES estado(id_estado)
	,fk_id_usuario INT FOREIGN KEY (fk_id_usuario) REFERENCES usuario(id_usuario)
);






