USE Prueba1
GO
CREATE VIEW vw_permiso_rol AS
SELECT r.abreviatura AS rol
	,m.abreviatura AS modulo 
	,perm.nombre AS nombre_permiso_m
	,em.descripcion AS permiso_modulo
	,p.nombre AS panel 
	,perp.nombre AS nombre_permiso_p
	,ep.descripcion AS permiso_panel
FROM rol as r
JOIN rol_permiso_modulo AS rpm ON rpm.fk_id_rol = r.id_rol
JOIN modulo AS m ON rpm.fk_id_modulo = m.id_modulo
JOIN permiso AS perm ON rpm.fk_id_permiso = perm.id_permiso
JOIN estado AS em ON rpm.fk_id_estado = em.id_estado
JOIN rol_permiso_panel AS rpp ON rpp.fk_id_rol = r.id_rol
JOIN panel AS p ON rpp.fk_id_panel = p.id_panel
JOIN permiso AS perp ON rpp.fk_id_permiso = perp.id_permiso
JOIN estado AS ep ON rpp.fk_id_estado = ep.id_estado
WHERE p.fk_id_modulo = m.id_modulo
GO

CREATE VIEW vw_permiso_panel AS
SELECT r.abreviatura AS rol
	,p.nombre AS panel 
	,per.nombre AS permiso
	,e.descripcion AS estado
 FROM rol_permiso_panel as rpp
JOIN rol AS r ON rpp.fk_id_rol = r.id_rol
JOIN panel AS p ON rpp.fk_id_panel = p.id_panel
JOIN permiso AS per ON rpp.fk_id_permiso = per.id_permiso
JOIN estado AS e ON rpp.fk_id_estado = e.id_estado
GO

CREATE VIEW vw_permiso_modulo AS
SELECT r.abreviatura AS rol
	,m.abreviatura AS modulo 
	,p.nombre AS permiso
	,e.descripcion AS estado
FROM rol_permiso_modulo AS per
JOIN rol AS r ON per.fk_id_rol = r.id_rol
JOIN modulo AS m ON per.fk_id_modulo = m.id_modulo
JOIN permiso AS p ON per.fk_id_permiso = p.id_permiso
JOIN estado AS e ON per.fk_id_estado = e.id_estado

CREATE VIEW vw_permiso_usuario AS
SELECT r.abreviatura AS Rol
		,u.usuario AS Usuario
		,p.nombre AS permiso
		,e.descripcion AS estado
FROM permiso_usuario AS pu
JOIN 
	permiso AS p ON pu.fk_id_permiso = p.id_permiso
JOIN
	usuario AS u ON pu.fk_id_usuario = u.id_usuario
JOIN 
	estado AS  e ON pu.fk_id_estado = e.id_estado
JOIN
	rol AS r ON u.fk_id_rol = r.id_rol;
