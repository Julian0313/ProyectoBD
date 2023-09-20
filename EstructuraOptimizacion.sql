CREATE DATABASE TiendaBdd
GO

USE TiendaBdd
GO

CREATE TABLE modulo (
    id_modulo INT IDENTITY(1, 1) PRIMARY KEY
	,abreviatura VARCHAR(50) NOT NULL
    ,nombre VARCHAR(50) NOT NULL
);

CREATE TABLE accion(
	id_accion INT IDENTITY(1, 1) PRIMARY KEY
	,nombre VARCHAR(50) NOT NULL
	,descripcion VARCHAR(MAX) NOT NULL

)

CREATE TABLE permiso(
	id_permiso INT IDENTITY(1, 1) PRIMARY KEY
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

CREATE TABLE permiso_panel(
	id_permisos_panel INT IDENTITY(1, 1) PRIMARY KEY
	,id_rol INT 
	,id_modulo INT
	,id_panel INT 
	,activo BIT 
	,accion INT
);

CREATE TABLE permiso_rol(
	id_rol_permiso INT IDENTITY(1, 1) PRIMARY KEY
	,id_rol INT 
	,id_permiso INT 
	,id_modulo INT
	,accion INT
	);

CREATE TABLE permiso_ususario(	
	id_permisos_ususario INT IDENTITY(1, 1) PRIMARY KEY
	,id_modulo INT 
	,id_permiso INT
	,activo BIT 
	,accion INT
);

CREATE TABLE usuario (
    id_usuario INT IDENTITY(1, 1) PRIMARY KEY
    ,usuario VARCHAR(50) NOT NULL
    ,contrasena VARCHAR(50) NOT NULL
	,segundo_factor BIT NOT NULL
	,ver_segundo_factor BIT NOT NULL
	,intentos INT NOT NULL
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
    ,direccion VARCHAR(100) NOT NULL
    ,celular VARCHAR(20) NOT NULL
    ,fecha_creacion DATETIME NULL
    ,fecha_modificacion DATETIME NULL
    ,activo BIT 
	,id_usuario INT 
);	

CREATE TABLE auditoria (
    id_auditoria INT IDENTITY(1,1) PRIMARY KEY
    ,fecha_evento DATETIME NOT NULL
    ,tipo_evento VARCHAR(50) NOT NULL
    ,nombre_tabla VARCHAR(100)
    ,id_resgustro_afectado INT
    ,id_usuario INT
    ,detalles VARCHAR(MAX)
);

CREATE TABLE historial_acceso_usuario (
    id_historial_acceso INT IDENTITY(1,1) PRIMARY KEY
    ,id_usuario INT
    ,fecha_inicio_sesion DATETIME NOT NULL
    ,direccion_ip VARCHAR(15)
    ,informacion_dispositivo VARCHAR(MAX)
);
