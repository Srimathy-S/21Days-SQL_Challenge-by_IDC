/* Create a patient summary that shows patient_id, full name in uppercase, 
service in lowercase, age category (if age >= 65 then 'Senior', if age >= 18 then 'Adult', else 'Minor'), 
and name length. Only show patients whose name length is greater than 10 characters.
*/

SELECT patient_id, UPPER(name) AS Name, LOWER(service) AS Service, 
CASE
	WHEN age >= 65 THEN 'Senior'
    WHEN age >= 18 THEN 'Adult'
    ELSE 'Minor'
END AS Age_Category,
LENGTH(name) AS Name_Length
FROM patients
WHERE LENGTH(name) >10;