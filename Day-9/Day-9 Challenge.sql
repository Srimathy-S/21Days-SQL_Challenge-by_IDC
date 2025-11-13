/* Calculate the average length of stay (in days) for each service, 
showing only services where the average stay is more than 7 days. 
Also show the count of patients and order by average stay descending.
*/

SELECT service,
    COUNT(patient_id) AS total_patients,
    ROUND(AVG(datediff(departure_date, arrival_date)),2) AS avg_stay_days
FROM patients
GROUP BY service
HAVING AVG(datediff(departure_date, arrival_date)) > 7
ORDER BY avg_stay_days DESC;
