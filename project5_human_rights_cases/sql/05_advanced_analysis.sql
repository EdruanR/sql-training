-- ==========================================
-- ANÁLISIS AVANZADO DE QUEJAS
-- ==========================================

-- 1. Evolución de casos cerrados por mes (tasa de cierre)
SELECT 
    DATE_TRUNC('month', received_date) AS mes,
    COUNT(*) FILTER (WHERE status = 'CERRADO') AS cerrados,
    COUNT(*) AS total,
    ROUND(COUNT(*) FILTER (WHERE status = 'CERRADO')::decimal / COUNT(*) * 100, 2) AS tasa_cierre_pct
FROM complaint
GROUP BY mes
ORDER BY mes;

-- 2. Ranking de áreas responsables según volumen de quejas asignadas
SELECT 
    a.area_name,
    COUNT(*) AS total_asignadas
FROM complaint c
JOIN area_responsible a 
    ON c.area_id = a.area_id
GROUP BY a.area_name
ORDER BY total_asignadas DESC;

-- 3. Ranking de municipios según tasa de cierre de casos
SELECT 
    m.mun_name,
    COUNT(*) FILTER (WHERE status = 'CERRADO') AS cerrados,
    COUNT(*) AS total,
    ROUND(COUNT(*) FILTER (WHERE status = 'CERRADO')::decimal / COUNT(*) * 100, 2) AS tasa_cierre_pct
FROM complaint c
JOIN municipality m 
    ON c.mun_id = m.mun_id
GROUP BY m.mun_name
ORDER BY tasa_cierre_pct DESC;

-- 4. Derecho humano más recurrente en cada municipio (Top 1 por mun_id)
SELECT 
    mun_name, 
    right_name, 
    total
FROM (
    SELECT m.mun_name, r.right_name, COUNT(*) AS total,
           ROW_NUMBER() OVER (PARTITION BY m.mun_name ORDER BY COUNT(*) DESC) AS rn
    FROM complaint c
    JOIN municipality m 
        ON c.mun_id = m.mun_id
    JOIN right_type r 
        ON c.right_id = r.right_id
    GROUP BY m.mun_name, r.right_name
) sub
WHERE rn = 1
ORDER BY total DESC;

-- 5. Tendencia de acumulado de quejas (running total)
SELECT 
    DATE_TRUNC('month', received_date) AS mes,
    COUNT(*) AS quejas_mes,
    SUM(COUNT(*)) OVER (ORDER BY DATE_TRUNC('month', received_date)) AS acumulado
FROM complaint
GROUP BY mes
ORDER BY mes;