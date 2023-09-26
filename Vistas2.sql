USE Prueba1
GO
CREATE VIEW vw_vista_permisos_rol AS
SELECT r.abreviatura AS Rol
	,m.abreviatura AS Modulo 
	,perm.nombre AS Permiso_modulo
	,em.descripcion AS Estado_permiso_modulo
	,p.nombre AS Panel 
	,perp.nombre AS Permiso_panel
	,ep.descripcion AS Estado_permiso_panel
FROM rol as r
JOIN rol_permiso_modulo AS rpm ON rpm.fk_id_rol = r.id_rol
JOIN modulo AS m ON rpm.fk_id_modulo = m.id_modulo
JOIN permiso AS perm ON rpm.fk_id_permiso = perm.id_permiso
JOIN estado AS em ON rpm.fk_id_estado = em.id_estado
JOIN rol_permiso_panel AS rpp ON rpp.fk_id_rol = r.id_rol
JOIN panel AS p ON rpp.fk_id_panel = p.id_panel
JOIN permiso AS perp ON rpp.fk_id_permiso = perp.id_permiso
JOIN estado AS ep ON rpp.fk_id_estado = ep.id_estado;

CREATE VIEW vw_vista_permisos_modulo AS