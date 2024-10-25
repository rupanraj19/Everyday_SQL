--  The total score of a hacker is the sum of their maximum scores for all of the challenges. Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. Exclude all hackers with a total score of  from your result.



SELECT hackers.hacker_id, hackers.name , SUM(scores.max_score)
FROM
(
    SELECT hacker_id, challenge_id, MAX(score) as max_score
    FROM submissions
    GROUP BY challenge_id, hacker_id
) AS scores
INNER JOIN hackers ON scores.hacker_id = hackers.hacker_id
group by
  hackers.hacker_id,
  hackers.name
having
  sum(scores.max_score) > 0
order by
  SUM(scores.max_score) DESC,
  hackers.hacker_id ASC;