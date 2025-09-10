WITH quejas_anuales AS (
    SELECT m.mun_id,
           m.mun_name,
           mp.poblacion,
           EXTRACT(YEAR FROM c.received_date)::int AS anio,
           COUNT(*) AS total_quejas,
           ROUND((COUNT(*)::numeric / mp.poblacion) * 100000, 2) AS quejas_por_100k
    FROM complaint c
    JOIN municipality m ON c.mun_id = m.mun_id
    JOIN municipality_population mp ON m.mun_id = mp.mun_id
    GROUP BY m.mun_id, m.mun_name, mp.poblacion, anio
),
promedio_estatal AS (
    SELECT anio,
           ROUND(AVG(quejas_por_100k), 2) AS promedio_100k
    FROM quejas_anuales
    GROUP BY anio
)
SELECT q.anio,
       q.mun_name,
       q.total_quejas,
       q.quejas_por_100k,
       mc.latitud,
       mc.longitud,
       CASE 
         WHEN q.quejas_por_100k > p.promedio_100k * 1.5 THEN 'ANOMALIA (Muy por encima)'
         WHEN q.quejas_por_100k < p.promedio_100k * 0.5 THEN 'ANOMALIA (Muy por debajo)'
         ELSE 'Normal'
       END AS clasificacion
FROM quejas_anuales q
JOIN promedio_estatal p ON q.anio = p.anio
JOIN municipality_coordinates mc ON q.mun_id = mc.mun_id
ORDER BY q.anio, q.quejas_por_100k DESC;