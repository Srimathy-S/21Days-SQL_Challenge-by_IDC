-- 1. Count the number of patients by each service.
USE hospital;

SELECT service,
COUNT(*) AS total_patients
FROM patients
GROUP BY service;

-- 2. Calculate the average age of patients grouped by service.
SELECT service,
ROUND(AVG(age), 2) AS avg_age
FROM patients
GROUP BY service;

-- 3. Find the total number of staff members per role.
SELECT role,
COUNT(*) AS total_staff_members
FROM staff
GROUP BY role;
