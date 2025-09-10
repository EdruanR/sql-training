-- ==============================================
-- DETECCIÓN DE ANOMALÍAS POR MUNICIPIO Y AÑO
-- Comparar quejas relativas a población
-- ==============================================

-- 1) Quejas por municipio y año (absolutas y normalizadas)
WITH quejas_anuales AS (
    SELECT m.mun_name,
           mp.poblacion,
           EXTRACT(YEAR FROM c.received_date)::int AS anio,
           COUNT(*) AS total_quejas,
           ROUND((COUNT(*)::numeric / mp.poblacion) * 100000, 2) AS quejas_por_100k -- normalización
    FROM complaint c
    JOIN municipality m
        ON c.mun_id = m.mun_id
    JOIN municipality_population mp 
        ON m.mun_id = mp.mun_id
    GROUP BY m.mun_name, mp.poblacion, anio
)

-- 2) Calcular el promedio estatal de quejas por 100k habitantes cada año
, promedio_estatal AS (
    SELECT anio,
           ROUND(AVG(quejas_por_100k), 2) AS promedio_100k
    FROM quejas_anuales
    GROUP BY anio
)

-- 3) Comparar municipios vs promedio, marcando anomalías
SELECT q.anio,
       q.mun_name,
       q.poblacion,
       q.total_quejas,
       q.quejas_por_100k,
       p.promedio_100k,
       ROUND(q.quejas_por_100k - p.promedio_100k, 2) AS diferencia,
       CASE 
         WHEN q.quejas_por_100k > p.promedio_100k * 1.5 
           THEN 'ANOMALIA (Muy por encima)'
         WHEN q.quejas_por_100k < p.promedio_100k * 0.5 
           THEN 'ANOMALIA (Muy por debajo)'
         ELSE 'Normal'
       END AS clasificacion
FROM quejas_anuales q
JOIN promedio_estatal p 
    ON q.anio = p.anio
ORDER BY q.anio, diferencia DESC;