# Project 6 – Análisis de Cartera de Crédito y Scoring Básico

Este proyecto simula el trabajo de un analista de riesgo en una institución de crédito.  
Se construye una base de datos de clientes y créditos en PostgreSQL, se analizan los patrones de morosidad en SQL y se desarrolla un prototipo de modelo de **scoring** en Python para estimar la probabilidad de que un crédito termine en mora.

---

## Objetivos

- Generar datos de clientes y créditos de forma simulada pero realista.
- Cargar y estructurar la información en PostgreSQL (`credito_demo`).
- Analizar la morosidad por segmentos (ingreso, edad, estatus laboral) usando SQL.
- Crear un modelo sencillo de scoring (clasificación binaria) en Python.
- Entender qué variables se asocian más a la probabilidad de morosidad.

---

## Estructura del proyecto

```text
project6_credit_demo/
├── data/
│   ├── customers.csv                  # 1000 clientes ficticios
│   ├── loans.csv                      # 3000 créditos ficticios
│   ├── generate_fake_customers.py     # genera clientes con Faker
│   ├── generate_fake_loans.py         # genera créditos con Faker
│   ├── load_customers_to_postgres.py  # carga customers.csv a PostgreSQL
│   └── load_loans_to_postgres.py      # carga loans.csv a PostgreSQL
│
├── sql/
│   ├── 01_create_schema.sql           # definición de tablas (customer, loan, payment)
│   ├── 03_basic_credit_reports.sql    # reportes básicos de cartera
│   └── 04_risk_segments.sql           # análisis de morosidad por ingreso, edad, empleo
│
└── notebooks/
    └── credit_analysis.ipynb          # análisis en Python + modelo scoring