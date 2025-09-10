-- KPI 1: Porcentaje de casos cerrados
SELECT 
    ROUND(SUM(CASE WHEN status = 'CERRADO' THEN 1 ELSE 0 END)::decimal / COUNT(*) * 100, 2) AS pct_cerrados
FROM complaint;

-- KPI 2: Municipio con más quejas
SELECT m.mun_name, COUNT(*) AS total_quejas
FROM complaint c
JOIN municipality m ON c.mun_id = m.mun_id
GROUP BY m.mun_name
ORDER BY total_quejas DESC
LIMIT 1;

-- KPI 3: Derecho humano más vulnerado
SELECT r.right_name, COUNT(*) AS total_quejas
FROM complaint c
JOIN right_type r ON c.right_id = r.right_id
GROUP BY r.right_name
ORDER BY total_quejas DESC
LIMIT 1;

-- KPI 4: Promedio de quejas recibidas por mes
SELECT ROUND(AVG(conteo),2) AS promedio_mensual
FROM (
    SELECT DATE_TRUNC('month', received_date) AS mes, COUNT(*) AS conteo
    FROM complaint
    GROUP BY mes
) sub;