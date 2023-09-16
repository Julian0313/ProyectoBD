CREATE DATABASE TiendaBdd
GO

USE TiendaBdd
GO

CREATE TABLE modulo (
    id_modulo INT PRIMARY KEY
    ,nombre VARCHAR(50) NOT NULL
);

CREATE TABLE permisos(
	id_permiso INT PRIMARY KEY
	,nombre VARCHAR(50) NOT NULL
	,id_modulo INT 
	);

CREATE TABLE rol(
	id_rol INT IDENTITY(1, 1) PRIMARY KEY
	,nombre VARCHAR(50) NOT NULL
	,activo BIT 
	);

CREATE TABLE panel(
	id_panel INT IDENTITY(1, 1) PRIMARY KEY
	,nombre VARCHAR(100) NOT NULL
	,id_modulo INT 
	,activo BIT 
);

CREATE TABLE permisos_panel(
	id_permisos_panel INT IDENTITY(1, 1) PRIMARY KEY
	,id_rol INT 
	,id_modulo INT
	,id_panel INT 
	,activo BIT 
);

CREATE TABLE permisos_rol(
	id_rol_permiso INT IDENTITY(1, 1) PRIMARY KEY
	,id_rol INT 
	,id_permiso INT 
	,id_modulo INT
	,crear BIT 
	,leer BIT 
	,actualizar BIT 
	,borrar BIT
	);

CREATE TABLE permisos_ususario(	
	id_permisos_ususario INT IDENTITY(1, 1) PRIMARY KEY
	,id_modulo INT 
	,id_permiso INT
	,activo BIT 
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
    ,id_rol INT 
    ,activo BIT 
);

CREATE TABLE historico_contrasena(
	id_historico INT IDENTITY(1, 1) PRIMARY KEY
	,contrasena VARCHAR(50) NOT NULL
	,fecha DATETIME NULL
	,id_usuario INT 
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
    ,activo BIT 
	,id_usuario INT 
);

CREATE TABLE producto (
	id_producto INT IDENTITY(1, 1) PRIMARY KEY 
	,nombre VARCHAR(128) NOT NULL
	,descripcion VARCHAR(128) NOT NULL
	,precio DECIMAL(18, 0) NOT NULL
	,cantidad INT NOT NULL
	,imagenUrl VARCHAR(128) 
	,fechaCreacion DATETIME NULL
	,fechaModificacion DATETIME NULL
	,activo BIT 
	);






