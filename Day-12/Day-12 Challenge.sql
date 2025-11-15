/* Analyze the event impact by comparing weeks with events vs weeks without events. 
Show: event status ('With Event' or 'No Event'), count of weeks, average patient 
satisfaction, and average staff morale. Order by average patient satisfaction descending.
*/

SELECT 
CASE 
	WHEN event IS NULL OR event = 'none' THEN 'No Event'
    ELSE 'With Event'
    END AS event_Status,
    
    COUNT(DISTINCT week) AS week_count,
    ROUND(AVG(patient_satisfaction),2)  AS Avg_patients_satisfaction,
    AVG(staff_morale) AS avg_staff_morale
    FROM services_weekly
    GROUP BY event_Status
    ORDER BY ROUND(Avg_patients_satisfaction, 2) DESC;
    
    
    