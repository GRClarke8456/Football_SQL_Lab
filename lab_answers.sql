-- Find all the matches from 2017
SELECT *
FROM matches
WHERE season = 2017;


-- Find all the matches featuring Barcelona
SELECT *
FROM matches
WHERE hometeam = 'Barcelona' OR 
awayteam = 'Barcelona';


-- What are the names of the Scottish divisions included?
SELECT name
FROM divisions
WHERE country = 'Scotland';


/*
Find the division code for the Bundesliga. 
Use that code to find out how many matches Freiburg have played in 
the Bundesliga since the data started being collected.
*/
SELECT code
FROM divisions
WHERE name = 'Bundesliga';   -- D1

SELECT COUNT(*)
FROM matches
WHERE division_code = 'D1' AND 
hometeam = 'Freiburg' OR awayteam = 'Freiburg';


/*
Find the unique names of the teams which include the word 
"City" in their name (as entered in the database)
*/
SELECT DISTINCT hometeam
FROM matches
WHERE hometeam LIKE '%City';


-- How many different teams have played in matches recorded in a French division?
-- First find french division code
SELECT code
FROM divisions
WHERE country = 'France';   -- F1 & F2
-- Use code to find different teams (Distinct needed)
SELECT COUNT(DISTINCT hometeam)
FROM matches
WHERE division_code = 'F1' OR division_code = 'F2';


-- Have Huddersfield played Swansea in the period covered?
SELECT *
FROM matches
WHERE hometeam = 'Huddersfield' AND awayteam = 'Swansea'
OR awayteam = 'Huddersfield' AND hometeam = 'Swansea' ;


-- How many draws were there in the Eredivisie between 2010 and 2015?
-- Find the division code
SELECT code
FROM divisions
WHERE name = 'Eredivisie';  --N2
-- Use Count function, WHERE, AND & logical operators
SELECT COUNT(*)
FROM matches
WHERE division_code = 'N1' AND ftr = 'D'
AND season >= 2010 AND season <= 2015;

/* 
Select the matches played in the Premier League in order of total goals scored from highest to lowest. 
Where there is a tie the match with more home goals should come first.
*/
-- Find the division code
SELECT code
FROM divisions
WHERE name = 'Premier League';  --E0
-- Use ORDER BY DESC
SELECT *
FROM matches
WHERE division_code = 'E0'
ORDER BY fthg DESC, ftag DESC;

-- In which division and which season were the most goals scored?
SELECT division_code, season, SUM(fthg), SUM(ftag)
FROM matches
GROUP BY division_code, season
ORDER BY division_code DESC
LIMIT 1;