WITH GolesPorPartido AS (
    SELECT 
        Year, 
        "Home Team Name" AS Local, 
        "Away Team Name" AS Visitante,
        ("Home Team Goals" + "Away Team Goals") AS TotalGoles
    FROM WorldCupMatches
    WHERE Year IS NOT NULL
)
SELECT * FROM GolesPorPartido 
WHERE TotalGoles >= 10
ORDER BY Year;