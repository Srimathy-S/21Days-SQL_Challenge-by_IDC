-- 1. Join patients and staff based on their common service field (show patient and staff who work in same service).

SELECT p.patient_id, 
	   p.name as Patient_Name, 
       p.service AS Service_Name,
	   s.staff_id, 
       s.staff_name
FROM patients p
INNER JOIN staff s
		ON p.service=s.service
ORDER BY p.service, p.name;

-- 2. Join services_weekly with staff to show weekly service data with staff information.

SELECT sw.*, s.staff_id, s.staff_name, s.role
FROM services_weekly sw
JOIN staff s
ON sw.service =s.service
ORDER BY sw.week;

-- 3. Create a report showing patient information along with staff assigned to their service.

SELECT p.patient_id,
	   p.name AS patient_name,
       p.service,
       s.staff_id,
       s.staff_name,
       s.role
FROM patients p
LEFT JOIN staff s ON p.service=s.service
ORDER BY p.patient_id;