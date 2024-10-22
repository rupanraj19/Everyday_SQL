--  start with vowels (like 'a%') or IN
SELECT DISTINCT CITY FROM STATION WHERE LEFT(CITY,1) IN ('A','E','I','O','U','a','e','i','o','u');
