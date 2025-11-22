/* Question: Create a report showing each service with: service name, total patients admitted,
   the difference between their total admissions and the average admissions across all services,
   and a rank indicator ('Above Average', 'Average', 'Below Average').
   Order by total patients admitted descending. */

SELECT 
    s.service,
    (SELECT COUNT(*) FROM patients p WHERE p.service = s.service) AS total_admissions,
    (SELECT COUNT(*) FROM patients p WHERE p.service = s.service)
      - (SELECT AVG(cnt) FROM (SELECT COUNT(*) AS cnt FROM patients GROUP BY service) t)
      AS diff_from_avg,
    CASE
        WHEN (SELECT COUNT(*) FROM patients p WHERE p.service = s.service) >
             (SELECT AVG(cnt) FROM (SELECT COUNT(*) AS cnt FROM patients GROUP BY service) t)
            THEN 'Above Average'
        WHEN (SELECT COUNT(*) FROM patients p WHERE p.service = s.service) =
             (SELECT AVG(cnt) FROM (SELECT COUNT(*) AS cnt FROM patients GROUP BY service) t)
            THEN 'Average'
        ELSE 'Below Average'
    END AS rank_status
FROM
    (SELECT DISTINCT service FROM patients) s
ORDER BY total_admissions DESC;
