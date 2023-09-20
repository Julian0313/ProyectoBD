USE TiendaBdd
GO
INSERT INTO rol
		(nombre)
		VALUES 
		('Admin'),
		('Clie'),
		('Empl')
GO
INSERT INTO modulo
		(abreviatura, nombre)
		VALUES
		('USU','Usuario'),
		('PER','Permisos')
GO
INSERT INTO accion
		(nombre, descripcion)
		VALUES
		('Acceso Modulo','Permite acceso al modulo'),
		('Acceso Modulo','Permite acceso al panel'),
		('Crear','Permite crear nuevos registros'),
		('Editar','Permite editar registros existentes'),
		('Eliminar','Permite eliminar registros existentes')