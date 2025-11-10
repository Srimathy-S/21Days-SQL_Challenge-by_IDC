-- 1.Find services that have admitted more than 500 patients in total.

USE hospital;
SELECT service,
SUM(patients_admitted) AS total_admitted
FROM services_weekly
GROUP BY service
HAVING SUM(patients_admitted) > 500;

-- 2.Show services where average patient satisfaction is below 75.

SELECT service,
ROUND(AVG(patient_satisfaction), 2) AS avg_patient_satisfaction
FROM services_weekly
GROUP BY service
HAVING AVG(patient_satisfaction) < 75;

-- 3.List weeks where total staff presence across all services was less than 50.

SELECT week,
SUM(present) AS total_staff_present
FROM staff_schedule
GROUP BY week
HAVING SUM(present) < 50;

