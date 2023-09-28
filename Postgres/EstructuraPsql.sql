CREATE TABLE estado (
    id_estado SERIAL PRIMARY KEY,
    descripcion VARCHAR(10) NOT NULL
);
CREATE INDEX IX_estado_id ON estado(id_estado);
CREATE INDEX IX_estado_descripcion ON estado(descripcion);

CREATE TABLE rol (
    id_rol SERIAL PRIMARY KEY,
    fk_id_estado INT REFERENCES estado(id_estado),
    abreviatura VARCHAR(5) NOT NULL,
    descripcion VARCHAR(50) NOT NULL
);
CREATE INDEX IX_rol_fk_id_estado ON rol(fk_id_estado);

CREATE TABLE modulo (
    id_modulo SERIAL PRIMARY KEY,
    fk_id_estado INT REFERENCES estado(id_estado),
    abreviatura VARCHAR(5) NOT NULL,
    descripcion VARCHAR(30) NOT NULL
);
CREATE INDEX IX_modulo_fk_id_estado ON modulo(fk_id_estado);

CREATE TABLE permiso (
    id_permiso SERIAL PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    descripcion TEXT NOT NULL
);

CREATE TABLE rol_permiso_modulo (
    id_permiso_modulo SERIAL PRIMARY KEY,
    fk_id_rol INT REFERENCES rol(id_rol),
    fk_id_modulo INT REFERENCES modulo(id_modulo),
    fk_id_permiso INT REFERENCES permiso(id_permiso),
    fk_id_estado INT REFERENCES estado(id_estado)
);
CREATE INDEX IX_permiso_modulo_composite ON rol_permiso_modulo(fk_id_rol, fk_id_modulo, fk_id_permiso, fk_id_estado);

CREATE TABLE panel (
    id_panel SERIAL PRIMARY KEY,
    fk_id_modulo INT REFERENCES modulo(id_modulo),
    fk_id_estado INT REFERENCES estado(id_estado),
    carpeta BOOLEAN NOT NULL,
    dependencia VARCHAR(50),
    nombre VARCHAR(50) NOT NULL,
    interfaz TEXT NOT NULL,
    ruta TEXT NOT NULL,
    habilitado INT NOT NULL
);
CREATE INDEX IX_panel_composite ON panel(fk_id_modulo, fk_id_estado);

CREATE TABLE rol_permiso_panel (
    id_permiso_panel SERIAL PRIMARY KEY,
    fk_id_rol INT REFERENCES rol(id_rol),
    fk_id_panel INT REFERENCES panel(id_panel),
    fk_id_permiso INT REFERENCES permiso(id_permiso),
    fk_id_estado INT REFERENCES estado(id_estado)
);
CREATE INDEX IX_permiso_panel_composite ON rol_permiso_panel(fk_id_rol, fk_id_panel, fk_id_estado, fk_id_permiso);

CREATE TABLE usuario (
    id_usuario SERIAL PRIMARY KEY,
    fk_id_rol INT REFERENCES rol(id_rol),
    fk_id_estado INT REFERENCES estado(id_estado),
    usuario VARCHAR(100) UNIQUE NOT NULL,
    contrasena VARCHAR(30) NOT NULL,
    segundo_factor BOOLEAN NOT NULL,
    mostrar_segundo_fa BOOLEAN NOT NULL,
    intento INT NOT NULL,
    bloqueo BOOLEAN NOT NULL,
    fecha_bloqueo TIMESTAMP,
    fecha_creacion TIMESTAMP NOT NULL,
    fecha_modificacion TIMESTAMP
);
CREATE INDEX IX_usuario_fk_id_rol ON usuario(fk_id_rol);
CREATE INDEX IX_usuario_fk_id_estado ON usuario(fk_id_estado);

CREATE TABLE permiso_usuario (
    id_permiso_usuario SERIAL PRIMARY,
    fk_id_usuario INT REFERENCES usuario(id_usuario),
    fk_id_permiso INT REFERENCES permiso(id_permiso),
    fk_id_estado INT REFERENCES estado(id_estado),
);
CREATE INDEX IX_permiso_usuario_composite ON permiso_usuario(id_usuario, fk_id_estado, fk_id_permiso);

CREATE TABLE persona (
    id_persona SERIAL PRIMARY KEY,
    fk_id_estado INT REFERENCES estado(id_estado),
    fk_id_usuario INT REFERENCES usuario(id_usuario),
    identificacion VARCHAR(15) NOT NULL,
    primer_nombre VARCHAR(30) NOT NULL,
    segundo_nombre VARCHAR(30),
    primer_apellido VARCHAR(30) NOT NULL,
    segundo_apellido VARCHAR(30),
    email VARCHAR(100) UNIQUE NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    numero_contacto VARCHAR(10) NOT NULL,
    numero_contacto_alt VARCHAR(10),
    fecha_creacion TIMESTAMP NOT NULL,
    fecha_modificacion TIMESTAMP
);
CREATE INDEX IX_persona_fk_id_estado ON persona(fk_id_estado);
CREATE INDEX IX_persona_fk_id_usuario ON persona(fk_id_usuario);

CREATE TABLE historico_contrasena (
    id_historico SERIAL PRIMARY KEY,
    fk_id_usuario INT REFERENCES usuario(id_usuario),
    contrasena VARCHAR(50) NOT NULL,
    fecha TIMESTAMP
);
CREATE INDEX IX_historico_contrasena_fk_id_usuario ON historico_contrasena(fk_id_usuario);

CREATE TABLE auditoria_usuario (
    id_auditoria_usuario SERIAL PRIMARY KEY,
    fk_id_permiso INT REFERENCES permiso(id_permiso),
    fk_id_usuario INT REFERENCES usuario(id_usuario),
    fecha_evento TIMESTAMP NOT NULL,
    id_resgistro_afectado INT,
    detalles TEXT
);
CREATE INDEX IX_auditoria_usuario_fk_id_permiso ON auditoria_usuario(fk_id_permiso);
CREATE INDEX IX_auditoria_usuario_fk_id_usuario ON auditoria_usuario(fk_id_usuario);

CREATE TABLE auditoria_permiso (
    id_auditoria_permiso SERIAL PRIMARY KEY,
    fk_id_permiso INT REFERENCES permiso(id_permiso),
    fk_id_usuario INT REFERENCES usuario(id_usuario),
    fecha_evento TIMESTAMP NOT NULL,
    nombre_tabla VARCHAR(100),
    id_resgistro_afectado INT,
    detalles TEXT
);
CREATE INDEX IX_auditoria_Permiso_fk_id_permiso ON auditoria_Permiso(fk_id_permiso);
CREATE INDEX IX_auditoria_Permiso_fk_id_usuario ON auditoria_Permiso(fk_id_usuario);

CREATE TABLE historial_acceso_usuario (
    id_historial_acceso SERIAL PRIMARY KEY,
    fk_id_usuario INT REFERENCES usuario(id_usuario),
    fecha_inicio_sesion TIMESTAMP NOT NULL,
    direccion_ip VARCHAR(15),
    informacion_dispositivo VARCHAR(200)
);
CREATE INDEX IX_historial_acceso_usuario_fk_id_usuario ON historial_acceso_usuario(fk_id_usuario);

CREATE TABLE token (
    id_token SERIAL PRIMARY KEY,
    fk_id_usuario INT REFERENCES usuario(id_usuario),
    token_valor VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    fecha_creacion TIMESTAMP NOT NULL,
    fecha_expiracion TIMESTAMP NOT NULL
);
CREATE INDEX IX_token_fk_id_usuario ON token(fk_id_usuario);

CREATE TABLE sesion (
    id_sesion SERIAL PRIMARY KEY,
    fk_id_usuario INT REFERENCES usuario(id_usuario),
    token_sesion VARCHAR(100) NOT NULL,
    fecha_creacion TIMESTAMP NOT NULL,
    fecha_expiracion TIMESTAMP NOT NULL
);
CREATE INDEX IX_sesion_fk_id_usuario ON sesion(fk_id_usuario);