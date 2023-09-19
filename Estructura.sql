CREATE DATABASE TiendaBdd
GO

USE TiendaBdd
GO

CREATE TABLE modulo (
    id_modulo VARCHAR PRIMARY KEY
	,abreviatura VARCHAR(50) NOT NULL
    ,nombre VARCHAR(50) NOT NULL
);

CREATE TABLE permisos(
	id_permiso INT PRIMARY KEY
	,nombre VARCHAR(50) NOT NULL
	,id_modulo INT 2
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
    ,direccion VARCHAR(50) NOT NULL
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

CREATE TABLE historial_accesoUsuario (
    id_historial_acceso INT IDENTITY(1,1) PRIMARY KEY
    ,id_usuario INT
    ,fecha_inicio_sesion DATETIME NOT NULL
    ,direccion_ip VARCHAR(15)
    ,informacion_dispositivo VARCHAR(MAX)
);


-- Cosas por hacer

-- Seguimiento de auditoría: 
-- considere agregar una tabla de "seguimiento de auditoría" para registrar eventos o cambios importantes en la base de datos. Esta tabla puede almacenar información sobre quién accedió o modificó los datos, qué cambios se realizaron y cuándo ocurrieron.

-- Políticas de contraseña: 
-- implemente una tabla para almacenar políticas de contraseña, como longitud mínima, requisitos de complejidad y reglas de caducidad. Se puede hacer referencia a esta tabla al validar y administrar contraseñas de usuario.

-- Gestión de tokens: 
-- si su aplicación utiliza tokens para la autenticación (por ejemplo, JWT), considere crear una tabla para almacenar tokens de forma segura. Incluya detalles como el token, el usuario asociado, la fecha de vencimiento y cualquier otra información relevante.

-- Gestión de sesiones: 
-- Implemente una tabla para gestionar las sesiones de los usuarios de forma segura. Almacene ID de sesión, información de usuario asociada y marcas de tiempo de vencimiento para manejar la autenticación basada en sesiones.

-- Historial de acceso del usuario: 
-- cree una tabla para registrar el historial de inicio de sesión del usuario, capturando detalles como el usuario, la marca de tiempo de inicio de sesión, la dirección IP y la información del dispositivo. Esto puede ayudar a detectar sospechosos.