-- https://www.hackerrank.com/challenges/challenges/problem?isFullScreen=true

/*

It first creates a `PARTITIONED` Common Table Expression (CTE) that groups records by
`hacker_id` in the `Challenges` table and counts how many challenges each hacker has
completed (`count_chal`). Using a `ROW_NUMBER()` function within `PARTITIONED`, it assigns
a unique row number (`rown`) to each hacker in each `count_chal` group, which helps
identify hackers with a unique completion count.

The main query then joins the `Hackers` table with `PARTITIONED`, allowing access to
each hacker’s `hacker_id`, `name`, and `count_chal`. A `WHERE` filter then selects only
those hackers who either completed the highest number of challenges or have a unique
`count_chal` (i.e., no other hacker shares that count).

Finally, the results are ordered by `count_chal` in descending order and by `hacker_id`
in ascending order for any ties in `count_chal`. This ensures the output highlights
the most active and uniquely accomplished hackers.
*/


WITH PARTITIONED AS (
    SELECT
        c.hacker_id,
        COUNT(c.challenge_id) AS count_chal,
        ROW_NUMBER() OVER (PARTITION BY COUNT(c.challenge_id) ORDER BY c.hacker_id) AS rown
    FROM Challenges c
    GROUP BY c.hacker_id
)
SELECT
    h.hacker_id,
    h.name,
    p.count_chal
FROM Hackers h
INNER JOIN PARTITIONED p ON h.hacker_id = p.hacker_id
WHERE (
    p.count_chal = (SELECT MAX(count_chal) FROM PARTITIONED)
    OR p.count_chal NOT IN (SELECT count_chal FROM PARTITIONED WHERE rown = 2)
)
ORDER BY p.count_chal DESC, h.hacker_id;