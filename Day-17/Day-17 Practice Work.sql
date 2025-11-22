/* Practice Questions */

/* 1. Show each patient with their service's average satisfaction as an additional column. */
SELECT p.patient_id,
       p.name,
       p.service,
       p.satisfaction,
       (SELECT AVG(p2.satisfaction)
        FROM patients p2
        WHERE p2.service = p.service) AS avg_service_satisfaction
FROM patients p;

/* 2. Create a derived table of service statistics and query from it. */
SELECT p.patient_id,
       p.name,
       p.service,
       (SELECT AVG(p2.satisfaction)
        FROM patients p2
        WHERE p2.service = p.service) AS avg_satisfaction,
       (SELECT COUNT(*)
        FROM patients p3
        WHERE p3.service = p.service) AS total_patients
FROM patients p;

/* 3. Display staff with their service's total patient count as a calculated field. */
SELECT s.staff_id,
       s.staff_name,
       s.role,
       s.service,
       (SELECT COUNT(*)
        FROM patients p
        WHERE p.service = s.service) AS service_patient_count
FROM staff s;
