SELECT 
    EXTRACT(YEAR FROM received_date)::int AS anio,
    EXTRACT(MONTH FROM received_date)::int AS mes,
    COUNT(*) AS total_quejas
FROM complaint
GROUP BY anio, mes
ORDER BY anio, mes;