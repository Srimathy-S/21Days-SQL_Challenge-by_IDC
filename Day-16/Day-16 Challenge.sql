/* Find all patients who were admitted to services that had at least one week 
where patients were refused AND the average patient satisfaction for that 
service was below the overall hospital average satisfaction. Show patient_id, 
name, service, and their personal satisfaction score.
*/

SELECT p.patient_id, p.name,
	   p.service, p.satisfaction
FROM patients p
WHERE p.service IN (
    SELECT sw.service
    FROM services_weekly sw
    WHERE sw.patients_refused > 0
    GROUP BY sw.service
    HAVING AVG(sw.patient_satisfaction) < (
        SELECT AVG(patient_satisfaction)
        FROM services_weekly
    )
);