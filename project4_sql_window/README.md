# Project 4 – SQL Window Functions + Power BI Visuals

Este proyecto explora el uso de **funciones de ventana (window functions)** en SQL aplicadas al dataset **Chinook** (tienda de música).  
El análisis se complementa con visualizaciones en Power BI, aprovechando los resultados generados en SQL para construir dashboards claros.

---

## Objetivos
- Aprender a usar **ROW_NUMBER, RANK, DENSE_RANK** en escenarios reales.
- Calcular métricas de **ventas acumuladas (running totals)**.
- Identificar el **Top N de clientes y artistas por país**.
- Visualizar los resultados en **Power BI** con tablas, rankings y gráficos.

---

## Archivos
- 'sql/01_row_number.sql' → Ranking de clientes por país usando ROW_NUMBER.
- 'sql/02_rank.sql' → Ranking global con RANK (maneja empates, salta posiciones).
- 'sql/03_dense_rank.sql' → Ranking global con DENSE_RANK (maneja empates sin saltar posiciones).
- 'sql/04_running_total.sql' → Ventas mensuales + ventas acumuladas (running total).
- 'sql/05_top_artists_by_country.sql' → Artistas más vendidos por país + ranking local.

- 'powerbi/rankings.pbix' → Reporte Power BI que contiene 5 páginas:
  1. **Ranking por país (ROW_NUMBER)**  
  2. **Ranking global (RANK)**  
  3. **Ranking global (DENSE_RANK)**  
  4. **Ventas mensuales y acumuladas (Running Total)**  
  5. **Top artistas por país (filtrados al Top 3)**  

---

## Resultados principales

### 🔹 ROW_NUMBER
Ranking de clientes por país → muestra al mejor cliente en cada país con consumo total.

### 🔹 RANK vs. DENSE_RANK
- **RANK**: asigna mismo valor en caso de empate pero **salta posiciones**.  
- **DENSE_RANK**: no salta posiciones, entrega un ranking "compacto".  

### 🔹 Running Total
Ventas acumuladas mes a mes → análisis de tendencia y crecimiento de ingresos a lo largo del tiempo.  

### 🔹 Top artistas por país
Ranking de artistas más vendidos por país.  
En el dashboard se usa un filtro 'rank_artist <= 3', mostrando los **Top 3 artistas por país** como gráfico de barras horizontales agrupadas.  

---

## Dashboards en Power BI
![Ranking Clientes por País](images/ranking_por_pais.png)
![Running Total](images/running_total.png)
![Top Artistas por País](images/top_artists.png)
