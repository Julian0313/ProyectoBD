CREATE DATABASE Prueba
GO

USE Prueba
GO

CREATE TABLE estado(
	id_estado INT PRIMARY KEY
	,descripcion VARCHAR(10) NOT NULL
	);
CREATE INDEX IX_estado_descripcion ON estado(descripcion);

CREATE TABLE modulo (
    id_modulo INT IDENTITY(1, 1) PRIMARY KEY
    ,id_estado INT 
    ,abreviatura VARCHAR(5) NOT NULL
    ,descripcion VARCHAR(30) NOT NULL
    );
CREATE INDEX IX_modulo_abreviatura ON modulo(abreviatura);

CREATE TABLE permiso(
	id_permiso INT IDENTITY(1, 1) PRIMARY KEY
	,nombre VARCHAR(30) NOT NULL
	,descripcion VARCHAR(MAX) NOT NULL
    );
CREATE INDEX IX_permiso_nombre ON permiso(nombre);

CREATE TABLE permiso_modulo(
	id_permiso_modulo INT IDENTITY(1, 1) PRIMARY KEY
    ,id_rol INT 
	,id_modulo INT 
    ,id_permiso INT 
    ,id_estado INT 
	);
CREATE INDEX IX_permiso_modulo_modulo ON permiso_modulo(id_modulo);
CREATE INDEX IX_permiso_modulo_permiso ON permiso_modulo(id_permiso);
CREATE INDEX IX_permiso_modulo_estado ON permiso_modulo(id_estado);

CREATE TABLE rol(
	id_rol INT IDENTITY(1, 1) PRIMARY KEY
    ,id_estado INT 
    ,abreviatura VARCHAR(5) NOT NULL
	,descripcion VARCHAR(50) NOT NULL	
	);
CREATE INDEX IX_modulo_abreviatura ON rol(abreviatura);

CREATE TABLE panel(
	id_panel INT IDENTITY(1, 1) PRIMARY KEY
	,id_modulo INT 
	,id_estado INT 
	,nombre VARCHAR(50) NOT NULL
    ,habilitado INT NOT NULL
    );
CREATE INDEX IX_panel_modulo ON panel(id_modulo);
CREATE INDEX IX_panel_estado ON panel(id_estado);

CREATE TABLE permiso_rol(
	id_rol_permiso INT IDENTITY(1, 1) PRIMARY KEY
	,id_rol INT 
	,id_permiso INT 
    ,id_estado INT 
	);

CREATE TABLE permiso_panel(
	id_permiso_panel INT IDENTITY(1, 1) PRIMARY KEY
	,id_rol INT 
	,id_panel INT 
	,id_estado INT 
	,id_permiso INT 
    );
CREATE INDEX IX_permiso_panel_rol ON permiso_panel(id_rol);
CREATE INDEX IX_permiso_panel_panel ON permiso_panel(id_panel);
CREATE INDEX IX_permiso_panel_estado ON permiso_panel(id_estado);
CREATE INDEX IX_permiso_panel_permiso ON permiso_panel(id_permiso);

CREATE TABLE usuario (
    id_usuario INT IDENTITY(1, 1) PRIMARY KEY
    ,id_rol INT 
    ,id_estado INT 
    ,usuario VARCHAR(100) NOT NULL
    ,contrasena VARCHAR(30) NOT NULL
	,segundo_factor BIT NOT NULL
	,mostrar_segundo_fa BIT NOT NULL
	,intento INT NOT NULL
	,bloqueo BIT NOT NULL
	,fecha_bloqueo DATETIME NULL
    ,fecha_creacion DATETIME NOT NULL
    ,fecha_modificacion DATETIME NULL
    );
CREATE INDEX IX_usuario_rol ON usuario(id_rol);
CREATE INDEX IX_usuario_estado ON usuario(id_estado);

CREATE TABLE persona (
    id_persona INT IDENTITY(1, 1) PRIMARY KEY
    ,id_estado INT 
	,id_usuario INT 
    ,identificacion VARCHAR(15) NOT NULL
    ,primer_nombre VARCHAR(30) NOT NULL
    ,segundo_nombre VARCHAR(30)
    ,primer_apellido VARCHAR(30) NOT NULL
    ,segundo_apellido VARCHAR(30)
    ,email VARCHAR(100) NOT NULL
    ,direccion VARCHAR(100) NOT NULL
    ,numero_contacto VARCHAR(10) NOT NULL
    ,numero_contacto2 VARCHAR(10)  NULL
    ,fecha_creacion DATETIME NOT NULL
    ,fecha_modificacion DATETIME NULL
    );
CREATE INDEX IX_persona_estado ON persona(id_estado);
CREATE INDEX IX_persona_usuario ON persona(id_usuario);

CREATE TABLE historico_contrasena(
	id_historico INT IDENTITY(1, 1) PRIMARY KEY
	,id_usuario INT 
	,contrasena VARCHAR(50) NOT NULL
	,fecha DATETIME NULL
    );
CREATE INDEX IX_historico_contrasena_usuario ON historico_contrasena(id_usuario);

CREATE TABLE auditoria (
    id_auditoria INT IDENTITY(1,1) PRIMARY KEY
    ,id_permiso INT 
    ,id_usuario INT 
    ,fecha_evento DATETIME NOT NULL
    ,nombre_tabla VARCHAR(100)
    ,id_resgustro_afectado INT
    ,detalles VARCHAR(MAX)   
    );
CREATE INDEX IX_auditoria_permiso ON auditoria(id_permiso);
CREATE INDEX IX_auditoria_usuario ON auditoria(id_usuario);

CREATE TABLE historial_acceso_usuario (
    id_historial_acceso INT IDENTITY(1,1) PRIMARY KEY
    ,id_usuario INT 
    ,fecha_inicio_sesion DATETIME NOT NULL
    ,direccion_ip VARCHAR(15)
    ,informacion_dispositivo VARCHAR(200)
    );
CREATE INDEX IX_historial_acceso_usuario ON historial_acceso_usuario(id_usuario);

CREATE TABLE token (
    id_token INT IDENTITY(1, 1) PRIMARY KEY,
    id_usuario INT 
    token_valor VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    fecha_creacion DATETIME NOT NULL,
    fecha_expiracion DATETIME NOT NULL
    );
CREATE INDEX IX_token_usuario ON token(id_usuario);

CREATE TABLE sesion (
    id_sesion INT IDENTITY(1, 1) PRIMARY KEY
    ,id_usuario INT 
    ,token_sesion VARCHAR(100) NOT NULL
    ,fecha_creacion DATETIME NOT NULL
    ,fecha_expiracion DATETIME NOT NULL
    );
CREATE INDEX IX_sesion_usuario ON sesion(id_usuario);

