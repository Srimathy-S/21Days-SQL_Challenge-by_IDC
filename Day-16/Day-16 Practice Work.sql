-- 1. Find patients who are in services with above-average staff count.

SELECT p.patient_id, p.name, p.service 
FROM patients p 
JOIN (SELECT service FROM staff 
GROUP BY service HAVING COUNT(*) > (SELECT AVG(staff_count) 
FROM (SELECT COUNT(*) AS staff_count FROM staff GROUP BY service) t)) x 
ON p.service = x.service;

-- 2. List staff who work in services that had any week with patient satisfaction below 70.

SELECT staff_id, staff_name,role, service
FROM staff
WHERE service IN (
    SELECT service
    FROM services_weekly
    WHERE patient_satisfaction < 70
);

-- 3. Show patients from services where total admitted patients exceed 1000.

SELECT *
FROM patients
WHERE service IN (
    SELECT service
    FROM services_weekly
    GROUP BY service
    HAVING SUM(patients_admitted) > 1000
);
