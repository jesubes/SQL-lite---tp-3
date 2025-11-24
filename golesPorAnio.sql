SELECT 
    CAST(Year AS TEXT) as Ano, 
    SUM("Home Team Goals" + "Away Team Goals") as GolesTotales
FROM WorldCupMatches
WHERE Year IS NOT NULL
GROUP BY Year

UNION ALL

SELECT 
    'TOTAL HISTORICO', 
    SUM("Home Team Goals" + "Away Team Goals")
FROM WorldCupMatches
WHERE Year IS NOT NULL;