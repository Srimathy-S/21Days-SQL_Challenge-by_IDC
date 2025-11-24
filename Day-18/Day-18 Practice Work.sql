
-- 1. Combine patient names and staff names into a single list.
SELECT name AS patient_name  FROM patients
UNION 
SELECT staff_name FROM staff;

-- 2. Create a union of high satisfaction patients (>90) and low satisfaction patients (<50).
SELECT patient_id, name, satisfaction, 'High Satisfaction' AS category FROM patients
WHERE satisfaction >= 90 
UNION 
SELECT patient_id, name, satisfaction, 'Low Satisfaction' AS category FROM patients
WHERE satisfaction < 50 
ORDER BY satisfaction DESC;

-- 3. List all unique names from both patients and staff tables.
SELECT name, 'Patient' AS type FROM patients
UNION ALL
SELECT staff_name, 'Staff' AS type FROM staff;