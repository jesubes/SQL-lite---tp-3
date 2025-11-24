# SQL-lite---tp-3
Trabajo practico 3 - bases de datos 2

# ⚽ Análisis de Datos FIFA World Cup con SQL

Este proyecto utiliza técnicas avanzadas de SQL (CTEs, Window Functions y OLAP) sobre un dataset de Kaggle de las Copas del Mundo para generar insights de valor sobre la historia del fútbol.

## 🛠️ Tecnologías
* **Motor de Base de Datos:** SQLite (DB Browser)
* **Datos:** Kaggle FIFA World Cup Dataset
* **Control de Versiones:** Git & GitHub

## 📊 Consultas y Técnicas Aplicadas






### 🔍 [Consulta 1: Detección de Partidos Históricos (CTE)](./golesPorPartido.sql)

**Objetivo:** Identificar "outliers" o anomalías estadísticas en la historia de los mundiales, específicamente partidos con una cantidad inusual de goles (10 o más).

**Lógica Técnica:**
Se utiliza una **Common Table Expression (CTE)** llamada `GolesPorPartido` para realizar un pre-procesamiento de los datos:
1.  **Limpieza:** Se filtran registros corruptos o nulos (`WHERE Year IS NOT NULL`).
2.  **Cálculo:** Se genera una métrica derivada sumando `Home Team Goals` + `Away Team Goals` para obtener el volumen total de goles por encuentro.
3.  **Filtrado:** La consulta principal selecciona sobre la CTE únicamente los eventos donde el `TotalGoles` es mayor o igual a 10.

**Insight:** Esta consulta revela que los partidos con marcadores de dos dígitos son eventos extremadamente raros y concentrados mayoritariamente en las primeras ediciones del torneo (1930-1958), evidenciando el cambio táctico hacia un fútbol más defensivo en la era moderna.







### 🏆 [Consulta 2: Ranking de Asistencia por Torneo (Window Functions)](./rankingAsistenciaDePublico.sql)

**Objetivo:** Determinar cuáles fueron los partidos con mayor afluencia de público en cada edición de la Copa del Mundo, sin mezclar torneos de épocas con distinta capacidad de estadios.

**Lógica Técnica:**
Se emplea una **Window Function (`RANK()`)** para asignar una posición a cada partido según su asistencia (`Attendance`):
1.  **Particionamiento:** `PARTITION BY Year` divide el dataset en ventanas independientes por cada torneo, asegurando que el ranking se reinicie en cada edición.
2.  **Ordenamiento:** `ORDER BY Attendance DESC` organiza los partidos dentro de cada ventana desde el más concurrido al menos concurrido.

**Insight:**
Al aislar los rankings por año, se observa que los partidos con mayor asistencia (Rank 1) corresponden casi invariablemente a la final del torneo o a partidos clave del país anfitrión, validando la correlación entre la instancia decisiva y la venta de entradas.







### 📊 [Consulta 3: Volumetría de Goles (Simulación OLAP/ROLLUP)](./golesPorAnio.sql)

**Objetivo:** Generar un reporte unificado que muestre el desglose de goles por edición junto con el gran total acumulado histórico, facilitando cálculos de participación relativa (share).

**Lógica Técnica:**
Dado que SQLite no soporta nativamente cláusulas OLAP como `ROLLUP` o `CUBE`, se simula mediante la técnica de `UNION ALL`:
1.  **Nivel Detalle:** La primera query agrupa los goles por `Year` para obtener la métrica discreta por torneo. Se aplica `CAST` al año para homogeneizar tipos de datos.
2.  **Nivel Agregado:** La segunda query calcula la suma escalar total de toda la tabla sin agrupar.
3.  **Unificación:** `UNION ALL` combina ambos resultados en un solo dataset, anexando una fila final etiquetada como 'TOTAL HISTORICO'.

**Insight:**
Esta vista multidimensional permite contrastar rápidamente el rendimiento ofensivo de un torneo específico contra el volumen histórico. Se evidencia cómo la expansión del formato (más partidos) ha inflado los números absolutos recientes, representando los últimos 5 mundiales cerca del 20-25% de todos los goles anotados en la historia.





## 📂 Estructura del Repositorio
* `WorldCups-sqlite.db`: Base de datos SQLite con las tablas importadas. [WorldCups](./WorldCups-sqlite.db)
* `queries.sql`: Archivo con las 3 sentencias SQL ejecutadas.
* `WorldCupMatches.csv`: Dataset original. [WorldCupMatches](./WorldCupMatches.csv)
* `README.md`: Documentación del proyecto.
