SELECT 
    Year, 
    "Home Team Name", 
    "Away Team Name", 
    Attendance,
    RANK() OVER (PARTITION BY Year ORDER BY Attendance DESC) as RankingAsistencia
FROM WorldCupMatches
WHERE Year IS NOT NULL AND Attendance IS NOT NULL;