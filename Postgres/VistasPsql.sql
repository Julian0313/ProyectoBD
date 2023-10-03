CREATE OR REPLACE VIEW vw_permiso_rol AS
SELECT
    r.abreviatura AS rol,
    m.abreviatura AS modulo,
    perm.nombre AS nombre_permiso_m,
    em.descripcion AS permiso_modulo,
    p.nombre AS panel,
    perp.nombre AS nombre_permiso_p,
    ep.descripcion AS permiso_panel
FROM
    rol r
JOIN
    rol_permiso_modulo rpm ON rpm.fk_id_rol = r.id_rol
JOIN
    modulo m ON rpm.fk_id_modulo = m.id_modulo
JOIN
    permiso perm ON rpm.fk_id_permiso = perm.id_permiso
JOIN
    estado em ON rpm.fk_id_estado = em.id_estado
JOIN
    rol_permiso_panel rpp ON rpp.fk_id_rol = r.id_rol
JOIN
    panel p ON rpp.fk_id_panel = p.id_panel
JOIN
    permiso perp ON rpp.fk_id_permiso = perp.id_permiso
JOIN
    estado ep ON rpp.fk_id_estado = ep.id_estado
WHERE
    p.fk_id_modulo = m.id_modulo;


CREATE OR REPLACE VIEW vw_permiso_panel AS
SELECT
    r.abreviatura AS rol,
    p.nombre AS panel,
    per.nombre AS permiso,
    e.descripcion AS estado
FROM
    rol_permiso_panel rpp
JOIN
    rol r ON rpp.fk_id_rol = r.id_rol
JOIN
    panel p ON rpp.fk_id_panel = p.id_panel
JOIN
    permiso per ON rpp.fk_id_permiso = per.id_permiso
JOIN
    estado e ON rpp.fk_id_estado = e.id_estado;


CREATE OR REPLACE VIEW vw_permiso_modulo AS
SELECT
    r.abreviatura AS rol,
    m.abreviatura AS modulo,
    p.nombre AS permiso,
    e.descripcion AS estado
FROM
    rol_permiso_modulo per
JOIN
    rol r ON per.fk_id_rol = r.id_rol
JOIN
    modulo m ON per.fk_id_modulo = m.id_modulo
JOIN
    permiso p ON per.fk_id_permiso = p.id_permiso
JOIN
    estado e ON per.fk_id_estado = e.id_estado;

CREATE OR REPLACE VIEW vw_permiso_usuario AS
SELECT 
	usu.usuario,
	r.abreviatura AS rol,
	pl.nombre AS panel,
	pr.nombre AS permiso,
	e.descripcion AS estado
FROM permiso_usuario AS pu
JOIN 
	usuario AS usu ON usu.id_usuario = pu.fk_id_usuario
JOIN 
	rol AS r ON r.id_rol = usu.fk_id_rol
JOIN 
	panel AS pl ON pl.id_panel = pu.fk_id_panel
JOIN 
	permiso AS pr ON pr.id_permiso = pu.fk_id_permiso
JOIN 
	estado AS e ON e.id_estado = pu.fk_id_estado
