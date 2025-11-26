-- 1. Rank patients by satisfaction score within each service.

USE hospital;
SELECT patient_id, name, service, satisfaction,
RANK() OVER(PARTITION BY service order by satisfaction DESC)  AS r
FROM patients;

-- 2. Assign row numbers to staff ordered by their name.

SELECT staff_id, staff_name, service, 
ROW_NUMBER() OVER(ORDER BY staff_name asc) AS Row_num
FROM staff;

-- 3. Rank services by total patients admitted.

SELECT service, count(patients_admitted) AS total_patients_admitted,
RANK() OVER(PARTITION BY service ORDER BY count(patients_admitted) desc) AS service_rank
FROM services_weekly
GROUP BY service;

