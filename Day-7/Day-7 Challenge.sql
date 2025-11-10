/* Identify services that refused more than 100 patients in total and
had an average patient satisfaction below 80. Show service name, 
total refused, and average satisfaction.
*/

USE hospital;

SELECT service AS service_name, 
SUM(patients_refused) AS total_refused,
ROUND(AVG(patient_satisfaction), 2) AS avg_patient_satisfaction
FROM services_weekly
GROUP BY service
HAVING total_refused > 100 and AVG(patient_satisfaction) < 80;

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
