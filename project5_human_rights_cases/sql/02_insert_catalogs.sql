-- ==============================================
-- INSERCIÓN DE CATÁLOGOS BÁSICOS
-- ==============================================

-- Poblar derechos humanos
INSERT INTO right_type (right_id, right_name) VALUES
(1, 'Derecho a la vida'),
(2, 'Derecho a la educación'),
(3, 'Derecho a la salud'),
(4, 'Derecho al agua'),
(5, 'Derecho al trabajo'),
(6, 'Derecho a la no discriminación'),
(7, 'Derecho a la seguridad')
ON CONFLICT DO NOTHING;

-- Poblar municipios
INSERT INTO municipality (mun_id, mun_name) VALUES
(1, 'León'),
(2, 'Irapuato'),
(3, 'Salamanca'),
(4, 'Celaya'),
(5, 'Guanajuato'),
(6, 'Dolores Hidalgo'),
(7, 'San Miguel de Allende')
ON CONFLICT DO NOTHING;

-- Poblar áreas responsables
INSERT INTO area_responsible (area_id, area_name) VALUES
(1, 'Atención Ciudadana'),
(2, 'Jurídico'),
(3, 'Mediación'),
(4, 'Archivo'),
(5, 'Dirección General')
ON CONFLICT DO NOTHING;