-- Creación de la tabla de población (sólo si aún no existe)
CREATE TABLE IF NOT EXISTS municipality_population (
    mun_id INT PRIMARY KEY,
    poblacion INT NOT NULL
);

-- Insertar datos de población (ejemplo ficticio/real aprox.)
INSERT INTO municipality_population (mun_id, poblacion) VALUES
(1, 1721676),
(2, 618323),
(3, 273417),
(4, 521169),
(5, 194500),
(6, 150200),
(7, 227200)
ON CONFLICT (mun_id) DO NOTHING;

-- Consulta: tasa de quejas cada 100 mil habitantes
SELECT m.mun_name,
       mp.poblacion,
       COUNT(c.*) AS total_quejas,
       ROUND( (COUNT(c.*)::numeric / mp.poblacion) * 100000, 2 ) AS quejas_por_100k
FROM complaint c
JOIN municipality m ON c.mun_id = m.mun_id
JOIN municipality_population mp ON m.mun_id = mp.mun_id
GROUP BY m.mun_name, mp.poblacion
ORDER BY quejas_por_100k DESC;