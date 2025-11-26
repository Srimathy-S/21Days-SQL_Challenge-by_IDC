/* For each service, rank the weeks by patient satisfaction score (highest first). 
Show service, week, patient_satisfaction, patients_admitted, and the rank. 
Include only the top 3 weeks per service.
*/
SELECT t3.* from
(SELECT service, week, patient_satisfaction, patients_admitted,
RANK() OVER(PARTITION BY service ORDER BY patient_satisfaction DESC) AS sat_rank
FROM services_weekly) as t3
WHERE sat_rank <=3;
