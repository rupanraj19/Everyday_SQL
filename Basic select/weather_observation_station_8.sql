--  starts and ends with vowels (like 'a%') or IN
SELECT DISTINCT CITY FROM STATION WHERE RIGHT(CITY,1) IN ('A','E','I','O','U','a','e','i','o','u') AND LEFT(CITY,1) IN ('A','E','I','O','U','a','e','i','o','u');
