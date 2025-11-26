-- 1. Calculate running total of patients admitted by week for each service.

SELECT week, service, 
	SUM(patients_admitted) OVER(PARTITION BY service ORDER BY week) AS running_total 
FROM services_weekly;











-- 2. Find the moving average of patient satisfaction over 4-week periods.

SELECT week, 
ROUND(AVG(patient_satisfaction) OVER(ROWS BETWEEN 3 PRECEDING AND CURRENT ROW),2) as mov_avg 
FROM services_weekly;

-- 3. Show cumulative patient refusals by week across all services.

SELECT week,
    SUM(patients_refused) AS weekly_refusals,
    SUM(SUM(patients_refused)) OVER (ORDER BY week) AS cumulative_refusals
FROM services_weekly
GROUP BY week
ORDER BY week;

