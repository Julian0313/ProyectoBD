INSERT INTO estado (id_estado, descripcion) VALUES 
    (1, 'Activo'),
    (0, 'Inactivo');

INSERT INTO rol (fk_id_estado, abreviatura, descripcion) VALUES 
    (1, 'ADMIN', 'Rol de administrador'),
    (1, 'USER', 'Rol de usuario');

INSERT INTO modulo (fk_id_estado, abreviatura, descripcion) VALUES 
	(1, 'CFG', 'Modulo de configuracion'),
	(1, 'RTS', 'Modulo de reportes');

INSERT INTO permiso (nombre, descripcion) VALUES
	('Acceder','Permite acceso al modulo o peneles'),
	('Crear','Permite crear nuevos registros'),
	('Leer','Permite consultar registros'),
	('Editar','Permite editar registros existentes'),
	('Eliminar','Permite eliminar registros existentes');

INSERT INTO rol_permiso_modulo (fk_id_rol, fk_id_modulo, fk_id_permiso, fk_id_estado) VALUES
	(1, 1, 1, 1),
	(1, 2, 1, 1),
	(2, 1, 1, 1),
	(2, 2, 1, 1);

INSERT INTO panel (fk_id_modulo, fk_id_estado, carpeta, dependencia, nombre, interfaz, ruta, habilitado) VALUES 
	(1, 1, TRUE, null, 'Seguridad', 'xxxxxx','xxxxxxx',1),
	(1, 1, TRUE, 'Seguridad', 'Usuarios', 'xxxxxx', 'xxxxxxx',1),
	(1, 1, FALSE, 'Usuarios', 'Gestion ususario', 'xxxxxx','xxxxxxx',1),
	(1, 1, FALSE, 'Usuarios', 'Cambio contraseña', 'xxxxxx','xxxxxxx',1),
	(1, 1, FALSE, 'Seguridad', 'Permisos', 'xxxxxx', 'xxxxxxx',1),
	(1, 1, FALSE, 'Seguridad', 'Permisos por roles', 'xxxxxx', 'xxxxxxx',1),
	(1, 1, FALSE, 'Seguridad', 'Permisos por usuarios', 'xxxxxx', 'xxxxxxx',1),
	(2, 1, TRUE, null, 'Reportes', 'xxxxxx','xxxxxxx',1),
	(2, 1, TRUE, 'Reportes', 'Generar Reportes', 'xxxxxx','xxxxxxx',1);

INSERT INTO rol_permiso_panel (fk_id_rol, fk_id_panel, fk_id_permiso, fk_id_estado) VALUES
	(1, 1, 1, 1),
	(1, 2, 1, 1),
	(1, 3, 1, 1),
	(1, 4, 1, 1),
	(1, 5, 1, 1),
	(1, 6, 1, 1),
	(1, 7, 1, 1),
	(1, 8, 1, 1),
	(1, 9, 1, 1),
	(2, 1, 1, 1),
	(2, 2, 1, 1),
	(2, 3, 1, 0),
	(2, 4, 1, 1),
	(2, 5, 1, 0),
	(2, 6, 1, 0),
	(2, 7, 1, 0),
	(2, 8, 1, 1),
	(2, 9, 1, 1);

INSERT INTO usuario (fk_id_rol, fk_id_estado, usuario, contrasena, segundo_factor, mostrar_segundo_fa, intento, bloqueo, fecha_bloqueo, fecha_creacion, fecha_modificacion) VALUES
    (1, 1, 'admin@gmail.com', 'adminpassword123', TRUE, FALSE, 3, FALSE, NULL, CURRENT_TIMESTAMP, NULL),
    (2, 1, 'jane.smith@example.com', 'password123', TRUE, FALSE, 3, FALSE, NULL, CURRENT_TIMESTAMP, NULL);

INSERT INTO persona (fk_id_estado, fk_id_usuario, identificacion, primer_nombre, primer_apellido, email, direccion, numero_contacto, fecha_creacion) VALUES
    (1, 1, '123456789', 'John', 'Doe', 'admin@gmail.com', 'Calle falsa 123', '123456789', CURRENT_TIMESTAMP),
    (1, 2, '987654321', 'Jane', 'Smith', 'jane.smith@example.com', 'Cra falsa 1234', '987654321', CURRENT_TIMESTAMP);