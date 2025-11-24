/* Create a comprehensive personnel and patient list showing: identifier (patient_id or 
staff_id), full name, type ('Patient' or 'Staff'), and associated service. Include 
only those in 'surgery' or 'emergency' services. Order by type, then service, then name.
*/

SELECT patient_id AS identifier, name AS Full_name, 'Patient' AS type, service 
FROM patients 
WHERE service IN ('surgery', 'emergency')
UNION 
SELECT staff_id AS identifier, staff_name AS Full_name, 'Staff' AS type, service 
FROM staff 
WHERE service IN ('surgery', 'emergency')
ORDER BY type, service,Full_name;