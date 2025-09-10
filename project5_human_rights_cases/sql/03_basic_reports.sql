-- Total de quejas cargadas
SELECT 
    COUNT(*) AS total_quejas
FROM complaint;

-- Quejas por estatus (ABIERTO, EN PROCESO, CERRADO)
SELECT 
    status, 
    COUNT(*) AS total_quejas
FROM complaint
GROUP BY status
ORDER BY total_quejas DESC;

-- Quejas por derecho vulnerado
SELECT 
    r.right_name, 
    COUNT(*) AS total_quejas
FROM complaint c
INNER JOIN right_type r 
    ON c.right_id = r.right_id
GROUP BY r.right_name
ORDER BY total_quejas DESC;

-- Quejas por municipio
SELECT 
    m.mun_name, 
    COUNT(*) AS total_quejas
FROM complaint c
INNER JOIN municipality m ON c.mun_id = m.mun_id
GROUP BY m.mun_name
ORDER BY total_quejas DESC;

-- Quejas mensuales (tendencia temporal)
SELECT 
    DATE_TRUNC('month', received_date) AS mes, 
    COUNT(*) AS total_quejas
FROM complaint
GROUP BY mes
ORDER BY mes;