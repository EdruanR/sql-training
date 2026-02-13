-- Morosidad por rango de ingreso mensual
SELECT
    CASE 
        WHEN c.income_monthly < 10000 THEN 'A) < 10k'
        WHEN c.income_monthly BETWEEN 10000 AND 20000 THEN 'B) 10k - 20k'
        WHEN c.income_monthly BETWEEN 20000 AND 40000 THEN 'C) 20k - 40k'
        ELSE 'D) > 40k'
    END AS rango_ingreso,
    COUNT(*) AS total_creditos,
    COUNT(*) FILTER (WHERE l.status = 'MOROSO') AS creditos_morosos,
    ROUND(
        COUNT(*) FILTER (WHERE l.status = 'MOROSO')::decimal 
        / COUNT(*) * 100, 2
    ) AS tasa_morosidad_pct
FROM loan l
JOIN customer c ON l.customer_id = c.customer_id
GROUP BY rango_ingreso
ORDER BY rango_ingreso;

-- Morosidad por grupo de edad
SELECT
    CASE 
        WHEN c.age < 25 THEN 'A) < 25'
        WHEN c.age BETWEEN 25 AND 35 THEN 'B) 25 - 35'
        WHEN c.age BETWEEN 36 AND 50 THEN 'C) 36 - 50'
        ELSE 'D) > 50'
    END AS grupo_edad,
    COUNT(*) AS total_creditos,
    COUNT(*) FILTER (WHERE l.status = 'MOROSO') AS creditos_morosos,
    ROUND(
        COUNT(*) FILTER (WHERE l.status = 'MOROSO')::decimal 
        / COUNT(*) * 100, 2
    ) AS tasa_morosidad_pct
FROM loan l
JOIN customer c ON l.customer_id = c.customer_id
GROUP BY grupo_edad
ORDER BY grupo_edad;

-- Morosidad por estatus laboral
SELECT
    c.employment_status,
    COUNT(*) AS total_creditos,
    COUNT(*) FILTER (WHERE l.status = 'MOROSO') AS creditos_morosos,
    ROUND(
        COUNT(*) FILTER (WHERE l.status = 'MOROSO')::decimal 
        / COUNT(*) * 100, 2
    ) AS tasa_morosidad_pct
FROM loan l
JOIN customer c ON l.customer_id = c.customer_id
GROUP BY c.employment_status
ORDER BY tasa_morosidad_pct DESC;