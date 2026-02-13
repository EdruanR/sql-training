-- Total de créditos y distribución por estatus
SELECT 
    status,
    COUNT(*) AS total_creditos
FROM loan
GROUP BY status
ORDER BY total_creditos DESC;

-- Monto total prestado
SELECT 
    SUM(amount) AS monto_total_prestado
FROM loan;

-- Monto promedio de crédito por estatus
SELECT 
    status,
    ROUND(AVG(amount), 2) AS monto_promedio
FROM loan
GROUP BY status
ORDER BY monto_promedio DESC;

-- Distribución de plazos
SELECT 
    term_months,
    COUNT(*) AS cantidad_creditos
FROM loan
GROUP BY term_months
ORDER BY term_months;

-- Promedio de tasa de interés por estatus
SELECT 
    status,
    ROUND(AVG(interest_rate), 2) AS tasa_promedio
FROM loan
GROUP BY status
ORDER BY tasa_promedio DESC;