# SQL-lite---tp-3
Trabajo practico 3 - bases de datos 2

# ⚽ Análisis de Datos FIFA World Cup con SQL

Este proyecto utiliza técnicas avanzadas de SQL (CTEs, Window Functions y OLAP) sobre un dataset de Kaggle de las Copas del Mundo para generar insights de valor sobre la historia del fútbol.

## 🛠️ Tecnologías
* **Motor de Base de Datos:** SQLite (DB Browser)
* **Datos:** Kaggle FIFA World Cup Dataset
* **Control de Versiones:** Git & GitHub

## 📊 Consultas y Técnicas Aplicadas

1.  **CTE (Common Table Expressions):** Utilizado para calcular el promedio de goles por partido y filtrar torneos con alta tasa de anotación.
2.  **Window Functions (RANK):** Implementado para crear un ranking histórico basado en la cantidad total de goles anotados por torneo.
3.  **Simulación OLAP:** Agregación de goles por ganador y cálculo de totales generales mediante `UNION ALL` (simulando ROLLUP).

## 💡 Insights del Negocio (Resultados)

1.  **Tendencia Defensiva Histórica:**
    El análisis revela que los mundiales con más de 3 goles por partido ocurrieron mayormente antes de 1960. Esto indica que el fútbol profesional moderno ha evolucionado hacia tácticas más defensivas y cerradas.

2.  **Impacto del Formato de 32 Equipos:**
    El ranking muestra que los torneos desde 1998 poseen los mayores volúmenes de goles absolutos. Esto valida que la expansión de cupos (32 equipos) incrementó exitosamente el "producto gol" para el espectáculo televisivo.

3.  **Consistencia de las Potencias:**
    La agrupación por ganadores demuestra que Brasil y Alemania no solo ganan títulos, sino que mantienen una producción ofensiva (Goles Totales) desproporcionadamente superior al resto, sugiriendo una infraestructura deportiva más sólida a largo plazo.

## 📂 Estructura del Repositorio
* `analysis.db`: Base de datos SQLite con las tablas importadas.
* `queries.sql`: Archivo con las 3 sentencias SQL ejecutadas.
* `WorldCupMatches.csv`: Dataset original. [WorldCupMatches](./WorldCupMatches.csv)
* `README.md`: Documentación del proyecto.
