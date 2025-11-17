/* Create a comprehensive report showing patient_id, patient name, age, service, 
and the total number of staff members available in their service. Only include 
patients from services that have more than 5 staff members. Order by number of 
staff descending, then by patient name.
*/

SELECT p.patient_id,
	   p.name AS patient_name,
       p.age AS patient_age,
       p.service,
       COUNT(DISTINCT s.staff_id) AS staff_count
FROM patients p
INNER JOIN staff s
ON p.service=s.service
GROUP BY p.patient_id, p.name, p.age, p.service
HAVING COUNT(DISTINCT s.staff_id) > 5
ORDER BY staff_count desc, p.name;