# Project 5 – Sistema de Estadísticas de Quejas de Derechos Humanos

Este proyecto simula las funciones de la **Unidad de Información Estadística y Documental** de la Procuraduría de Derechos Humanos de Guanajuato.  
El objetivo fue **registrar, organizar y analizar** quejas ciudadanas ficticias, normalizándolas por población para identificar anomalías y generar reportes útiles para la toma de decisiones.

---

## Objetivos
- Generar un sistema de registro ficticio de **10,000 quejas (2019–2024)**.  
- Almacenar datos en PostgreSQL con catálogos de referencia (derecho vulnerado, municipio, área responsable).  
- Analizar tendencias anuales, mensuales y territoriales.  
- Normalizar por población para detectar **municipios con anomalías**.  
- Crear dashboards en **Power BI** para la visualización y presentación de resultados.  

---

## Estructura del proyecto

## Metodología
1. **Generación de datos:**  
   - Se creó un dataset con 10,000 quejas ficticias mediante la librería `Faker` en Python.  
   - Periodo cubierto: 2019–2024.  
   - Incluye tipo de derecho vulnerado, municipio, área responsable, estatus y descripción.  

2. **Base de datos (PostgreSQL):**  
   - BD `derechos_humanos`.  
   - Tablas de catálogos (`right_type`, `municipality`, `area_responsible`, `municipality_population`, `municipality_coordinates`).  
   - Tabla `complaint` como registro maestro.

3. **Análisis SQL:**  
   - Reportes básicos y KPIs institucionales.  
   - Análisis avanzado de cierre de casos, ranking de áreas, derecho más vulnerado por municipio.  
   - Normalización de quejas por población municipal (tasa por cada 100k).  
   - Detección de anomalías (muy por encima / muy por debajo).  
   - Comparación mensual-año (enero-diciembre contra cada año).

4. **Visualización en Power BI:**  
   - Página 1: Heatmap anomalías (municipio × año).  
   - Página 2: Mapa municipal con anomalías (usando lat/long).  
   - Página 3: Comparación mensual-año (líneas enero-diciembre separados por año).  
   - Página 4: KPIs ejecutivos (% de cierre, municipio con más tasa, etc.).

---

## Ejemplo de resultados
- **Dolores Hidalgo** presenta tasas por 100k habitantes muy por encima del promedio estatal.  
- **León** tiene el mayor número absoluto de quejas, pero normalizado por población cae dentro de lo esperado.  
- En **2023** hubo un repunte de casos en abril respecto a años anteriores.  
- Áreas como **Atención Ciudadana** cargan con la mayoría de registros, seguidas por **Jurídico**.  

---

## Próximos pasos
- Incluir análisis de tiempos de resolución (días promedio desde apertura hasta cierre).  
- Análisis estacional comparando promedios históricos por mes.  
- Identificación de subregistro en municipios con tasas anormalmente bajas.  
- Dashboard web con actualización automática de datos.