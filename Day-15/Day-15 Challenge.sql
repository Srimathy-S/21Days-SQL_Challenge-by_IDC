/*Create a comprehensive service analysis report for week 20 showing: 
service name, total patients admitted that week, total patients refused, 
average patient satisfaction, count of staff assigned to service, and 
count of staff present that week. Order by patients admitted descending. 
*/
SELECT 
    sw.service,
    SUM(sw.patients_admitted) as total_patients_admitted,
    SUM(sw.patients_refused) as total_patients_refused,
    ROUND(AVG(sw.patient_satisfaction)) AS avg_patient_satisfaction,
    COUNT(ss.staff_id) AS total_staff_assigned,
    COUNT(CASE WHEN ss.present = 1 THEN 1 END) AS staff_present
FROM  services_weekly sw
LEFT JOIN staff s 
	ON s.service = sw.service
LEFT JOIN staff_schedule ss 
	ON ss.staff_id = s.staff_id AND ss.week = sw.week
WHERE sw.week = 20
GROUP BY sw.service,sw.patients_admitted,sw.patients_refused
ORDER BY sw.patients_admitted DESC;