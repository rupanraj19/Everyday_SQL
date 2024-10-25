-- https://www.hackerrank.com/challenges/the-report/problem?isFullScreen=true

-- if (condition, if met , otherwise)

SELECT if(g.grade >=8, s.name, NULL), g.grade, s.marks FROM students s INNER JOIN grades g ON s.marks BETWEEN g.min_mark AND g.max_mark ORDER BY g.grade DESC, s.name, s.marks ASC;