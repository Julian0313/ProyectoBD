USE Prueba
GO
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

INSERT INTO permiso_modulo (fk_id_rol, fk_id_modulo, fk_id_permiso, fk_id_estado) VALUES
	(1, 1, 1, 1),
	(2, 2, 1, 1);

INSERT INTO panel (fk_id_modulo, fk_id_estado, carpeta, dependencia, nombre, interfaz, ruta, habilitado) VALUES 
	(1, 1, 1, null, 'Seguridad', 'xxxxxx','xxxxxxx',1),
	(1, 1, 1, 'Seguridad', 'Usuarios', 'xxxxxx', 'xxxxxxx',1),
	(1, 1, 0, 'Usuarios', 'Gestion ususario', 'xxxxxx','xxxxxxx',1),
	(1, 1, 0, 'Usuarios', 'Cambio contraseña', 'xxxxxx','xxxxxxx',1),
	(1, 1, 0, 'Seguridad', 'Permisos', 'xxxxxx', 'xxxxxxx',1),
	(1, 1, 0, 'Seguridad', 'Permisos por roles', 'xxxxxx', 'xxxxxxx',1),
	(1, 1, 0, 'Seguridad', 'Permisos por usuarios', 'xxxxxx', 'xxxxxxx',1),

INSERT INTO permiso_panel (fk_id_rol, fk_id_panel,  fk_id_estado, fk_id_permiso) VALUES
	(1, 1, 1, 1),
	(2, 2, 1, 1),
	(2, 1, 0, 1);

INSERT INTO usuario (fk_id_rol, fk_id_estado, usuario, contrasena, segundo_factor, mostrar_segundo_fa, intento, bloqueo, fecha_bloqueo, fecha_creacion, fecha_modificacion) VALUES
    (1, 1, 'admin@gmail.com', 'adminpassword123', 1, 0, 3, 0, NULL, GETDATE(), NULL),
    (2, 1, 'jane.smith@example.com', 'password123', 1, 0, 3, 0, NULL, GETDATE(), NULL);

INSERT INTO persona (fk_id_estado, fk_id_usuario, identificacion, primer_nombre, primer_apellido, email, direccion, numero_contacto, fecha_creacion) VALUES
    (1, 1, '123456789', 'John', 'Doe', 'admin@gmail.com', 'Calle falsa 123', '123456789', GETDATE()),
    (1, 2, '987654321', 'Jane', 'Smith', 'jane.smith@example.com', 'Cra falsa 1234', '987654321', GETDATE());

-- Permisos rol JOIN 
SELECT id_rol_permiso
      ,r.abreviatura
      ,p.descripcion
      ,e.descripcion
  FROM permiso_rol as pr
  JOIN rol as r ON pr.fk_id_rol = r.id_rol
  JOIN permiso as p ON pr.fk_id_permiso = p.id_permiso
  JOIN estado as e ON pr.fk_id_estado = e.id_estado
  WHERE pr.fk_id_rol = 1

-- Permisos modulo JOIN 

  SELECT TOP (1000) [id_permiso_modulo]
      ,r.abreviatura as Rol
      ,m.abreviatura as Modulo
      ,p.nombre as Permiso
      ,e.descripcion as Estado 
  FROM permiso_modulo as pm 
  JOIN rol as r ON pm.fk_id_rol = r.id_rol
  JOIN modulo as m ON pm.fk_id_modulo = m.id_modulo
  JOIN permiso as p ON pm.fk_id_permiso = p.id_permiso
  JOIN estado as e ON pm.fk_id_estado = e.id_estado

