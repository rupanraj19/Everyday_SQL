-- Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.

SELECT COUNTRY.CONTINENT, FLOOR(AVG(CITY.POPULATION)) FROM City INNER JOIN COUNTRY ON city.countrycode = country.code GROUP BY country.continent;