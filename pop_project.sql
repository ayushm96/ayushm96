--SELECT country, capital, continent, pop_2022 FROM population
--ORDER BY pop_2022 DESC
--LIMIT 10;

--SELECT country, capital, continent, area FROM population
--ORDER BY area DESC
--LIMIT 10



-- Calculating the average population for the year 2022
--SELECT ROUND(AVG(pop_2022),0) AS average_pop
--FROM population

-- Calculating the number of countries with population greater than the average population

--SELECT COUNT(*) as num_countries
--FROM population
--WHERE pop_2022 > (SELECT ROUND(AVG(pop_2022),0) AS average_pop
--FROM population);


--SELECT *
--FROM population
--WHERE pop_2022 > (SELECT ROUND(AVG(pop_2022),0) AS average_pop
--FROM population)


--SELECT COUNT(*) AS number_countries FROM population
--WHERE pop_2022 > 100000000



--SELECT continent, SUM(pop_2022) as total_population
--FROM population
--GROUP BY continent
--ORDER BY SUM(pop_2022) DESC

--ALTER TABLE population
--ADD COLUMN population_growth numeric;

--UPDATE population
--SET population_growth = ROUND(("pop_2020" - "pop_2015")/"pop_2015"*100,2);

--SELECT country, continent, population_growth 
--FROM population
--ORDER BY population_growth DESC
--LIMIT 5

--SELECT COUNT(population_growth) AS number_countries FROM population
--WHERE population_growth > (SELECT population_growth
--FROM population
--WHERE country = 'India')

--SELECT country, continent, pop_2022,
--rank() over (PARTITION BY continent ORDER BY pop_2022 DESC) as rank
--FROM population
--WHERE RANK() OVER (PARTITION BY continent ORDER BY pop_2022 DESC) <= 3
--ORDER BY continent, pop_2022;

--SELECT country, continent, pop_2022,
--       RANK() OVER (PARTITION BY continent ORDER BY pop_2022 DESC) AS population_rank
--FROM population
--WHERE RANK() OVER (PARTITION BY continent ORDER BY pop_2022 DESC) <= 3
--ORDER BY continent, population_rank;

WITH country_ranks AS (
    SELECT country, continent, pop_2022,
           RANK() OVER (PARTITION BY continent ORDER BY pop_2022 DESC) AS population_rank
    FROM population
)
SELECT country, continent, pop_2022
FROM country_ranks
WHERE population_rank <= 3
ORDER BY continent, population_rank;

















