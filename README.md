# SQL Training

Este repositorio documenta mi proceso de aprendizaje y práctica de SQL trabajando con PostgreSQL, Python y Power BI.  
Cada carpeta contiene un mini-proyecto práctico, con queries, notebooks o reportes según corresponda.  

---

## Proyectos

### [Project 1: Chinook – SQL Básico](./project1_chinook/README.md)
- Queries básicos en SQL (SELECT, WHERE, JOIN, GROUP BY).  
- Dataset: Chinook DB (tienda de música).  
- Objetivo: identificar el Top 10 de canciones más vendidas.  

---

### [Project 2: Chinook – SQL + Python](./project2_python_sql/README.md)
- Conexión de PostgreSQL ↔ Python (SQLAlchemy + Pandas).  
- Análisis con DataFrames y gráficas en Matplotlib.  
- Objetivo: generar un mini dashboard de:  
  - Ventas totales por país.  
  - Evolución mensual de ventas.  
  - Ranking de clientes top.  

---

### [Project 3: Customer Retention & Churn](./project3_customer_retention/README.md)
- Análisis de retención de clientes (cohortes) con SQL (CTEs + funciones de fecha).  
- Construcción de métricas de churn % y retención %.  
- Visualización en Power BI: heatmap de cohortes.  
- Objetivo: medir la permanencia de clientes y abandono mes a mes.  

---

### [Project 4: SQL Window Functions + Power BI](./project4_sql_window/README.md)
- Uso de funciones de ventana: ROW_NUMBER, RANK, DENSE_RANK.  
- Ranking de clientes por país, global y con empates.  
- Running total de ventas acumuladas por mes.  
- Top artistas más vendidos por país.  
- Visualización de resultados en Power BI con tablas, gráficos y dashboards. 

---

### [Project 5: Sistema de Estadísticas de Quejas de Derechos Humanos](./project5_human_rights_cases/README.md)
- Simulación de un sistema de registro estadístico de quejas.  
- Dataset ficticio de 10,000 registros (2019–2024) generado con Faker.  
- Almacenamiento y análisis en PostgreSQL.  
- Detección de anomalías normalizadas por población.  
- Dashboards dinámicos en Power BI (mapa, heatmap, comparativas anuales).  

---

### [Project 6: Cartera de Crédito y Scoring Básico](./project6_credit_demo/README.md)
- Simulación de clientes y créditos personales con Faker.
- Almacenamiento en PostgreSQL (`credito_demo`).
- Análisis de morosidad por segmentos (ingreso, edad, empleo) en SQL.
- Desarrollo de un modelo exploratorio de scoring (regresión logística) en Python.

---

## Stack usado
- PostgreSQL 17
- VS Code
- Python 3.13 + Pandas, SQLAlchemy, Matplotlib
- Power BI Desktop

---

## Próximos pasos 
- Project 7: queries de SQL avanzado (LAG, LEAD, comparaciones históricas).