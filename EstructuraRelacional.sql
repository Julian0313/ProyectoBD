CREATE DATABASE TiendaBdd
GO

USE TiendaBdd
GO

CREATE TABLE estado(
	id_estado INT IDENTITY(1, 1) PRIMARY KEY
	,nombre VARCHAR(50) NOT NULL
	);

CREATE TABLE modulo (
    id_modulo INT IDENTITY(1, 1) PRIMARY KEY
    ,abreviatura VARCHAR(50) NOT NULL
    ,nombre VARCHAR(50) NOT NULL
    );

CREATE TABLE accion(
	id_accion INT IDENTITY(1, 1) PRIMARY KEY
	,nombre VARCHAR(50) NOT NULL
	,descripcion VARCHAR(MAX) NOT NULL
    );

CREATE TABLE permiso(
	id_permiso INT IDENTITY(1, 1) PRIMARY KEY
	,nombre VARCHAR(50) NOT NULL
	,fk_id_modulo INT FOREIGN KEY (fk_id_modulo) REFERENCES modulo(id_modulo)
    ,fk_id_accion INT FOREIGN KEY (fk_id_accion) REFERENCES accion(id_accion)
    ,fk_id_estado INT FOREIGN KEY (fk_id_estado) REFERENCES estado(id_estado)
	);

CREATE TABLE rol(
	id_rol INT IDENTITY(1, 1) PRIMARY KEY
	,nombre VARCHAR(50) NOT NULL
	,fk_id_estado INT FOREIGN KEY (fk_id_estado) REFERENCES estado(id_estado)
	);

CREATE TABLE panel(
	id_panel INT IDENTITY(1, 1) PRIMARY KEY
	,nombre VARCHAR(100) NOT NULL
    ,habilitado INT NOT NULL
	,fk_id_modulo INT FOREIGN KEY (fk_id_modulo) REFERENCES modulo(id_modulo)
	,fk_id_estado INT FOREIGN KEY (fk_id_estado) REFERENCES estado(id_estado)
    );

CREATE TABLE permiso_panel(
	id_permiso_panel INT IDENTITY(1, 1) PRIMARY KEY
	,fk_id_rol INT FOREIGN KEY (fk_id_rol) REFERENCES rol(id_rol)
	,fk_id_modulo INT FOREIGN KEY (fk_id_modulo) REFERENCES modulo(id_modulo)
	,fk_id_panel INT FOREIGN KEY (fk_id_panel) REFERENCES panel(id_panel)
	,fk_id_estado INT FOREIGN KEY (fk_id_estado) REFERENCES estado(id_estado)
	,fk_id_accion INT FOREIGN KEY (fk_id_accion) REFERENCES accion(id_accion)
    );

CREATE TABLE permiso_rol(
	id_rol_permiso INT IDENTITY(1, 1) PRIMARY KEY
	,fk_id_rol INT FOREIGN KEY (fk_id_rol) REFERENCES rol(id_rol)
	,fk_id_permiso INT FOREIGN KEY (fk_id_permiso) REFERENCES permiso(id_permiso)
	,fk_id_modulo INT FOREIGN KEY (fk_id_modulo) REFERENCES modulo(id_modulo)
	,fk_id_accion INT FOREIGN KEY (fk_id_accion) REFERENCES accion(id_accion)
	);

CREATE TABLE permiso_ususario(	
	id_permiso_ususario INT IDENTITY(1, 1) PRIMARY KEY
	,fk_id_modulo INT FOREIGN KEY (fk_id_modulo) REFERENCES modulo(id_modulo)
	,fk_id_permiso INT FOREIGN KEY (fk_id_permiso) REFERENCES permiso(id_permiso)
	,fk_id_estado INT FOREIGN KEY (fk_id_estado) REFERENCES estado(id_estado)
    ,fk_id_accion INT FOREIGN KEY (fk_id_accion) REFERENCES accion(id_accion)
    );

CREATE TABLE usuario (
    id_usuario INT IDENTITY(1, 1) PRIMARY KEY
    ,usuario VARCHAR(50) NOT NULL
    ,contrasena VARCHAR(50) NOT NULL
	,segundo_factor BIT NOT NULL
	,mostrar_segundo_fa BIT NOT NULL
	,intento INT NOT NULL
	,bloqueo BIT NOT NULL
	,fecha_bloqueo DATETIME NULL
    ,fecha_creacion DATETIME NOT NULL
    ,fecha_modificacion DATETIME NULL
    ,fk_id_rol INT FOREIGN KEY (fk_id_rol) REFERENCES rol(id_rol)
    ,fk_id_estado INT FOREIGN KEY (fk_id_estado) REFERENCES estado(id_estado)
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
    ,fk_id_estado INT FOREIGN KEY (fk_id_estado) REFERENCES estado(id_estado)
	,fk_id_usuario INT FOREIGN KEY (fk_id_usuario) REFERENCES usuario(id_usuario)
    );

CREATE TABLE auditoria (
    id_auditoria INT IDENTITY(1,1) PRIMARY KEY
    ,fecha_evento DATETIME NOT NULL
    ,fk_id_accion INT FOREIGN KEY (fk_id_accion) REFERENCES accion(id_accion)
    ,nombre_tabla VARCHAR(100)
    ,id_resgustro_afectado INT
    ,fk_id_usuario INT FOREIGN KEY (fk_id_usuario) REFERENCES usuario(id_usuario)
    ,detalles VARCHAR(MAX)
    );

CREATE TABLE historial_acceso_usuario (
    id_historial_acceso INT IDENTITY(1,1) PRIMARY KEY
    ,fk_id_usuario INT FOREIGN KEY (fk_id_usuario) REFERENCES usuario(id_usuario)
    ,fecha_inicio_sesion DATETIME NOT NULL
    ,direccion_ip VARCHAR(15)
    ,informacion_dispositivo VARCHAR(MAX)
    );