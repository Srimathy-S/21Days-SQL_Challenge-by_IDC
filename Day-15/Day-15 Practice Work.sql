-- 1.Join patients, staff, and staff_schedule to show patient service and staff availability.
Use hospital;
SELECT 
    p.patient_id,
    p.name as patient_name,
    p.service,
    s.staff_name,
    s.role,
    ss.week,
    ss.present AS present_cnt
FROM patients p
LEFT JOIN staff s ON p.service = s.service
LEFT JOIN staff_schedule ss ON s.staff_id = ss.staff_id;

-- 2.Combine services_weekly with staff and staff_schedule for comprehensive service analysis.

SELECT 
    sw.week,
    sw.month,
    sw.service,
    s.staff_id,
    s.staff_name,
    s.role,
    ss.present
FROM services_weekly AS sw
LEFT JOIN staff AS s
    ON sw.service = s.service
LEFT JOIN staff_schedule AS ss
    ON s.staff_id = ss.staff_id AND sw.week = ss.week;
    
-- 3.Create a multi-table report showing patient admissions with staff information.

SELECT 
    p.patient_id,
    p.name AS patient_name,
    p.service AS patient_service,
    sc.week,
    sc.present AS staff_available,
    s.staff_id,
    s.staff_name,
    s.role
FROM patients AS p
LEFT JOIN staff AS s
    ON p.service = s.service         
LEFT JOIN staff_schedule AS sc
    ON s.staff_id = sc.staff_id;



