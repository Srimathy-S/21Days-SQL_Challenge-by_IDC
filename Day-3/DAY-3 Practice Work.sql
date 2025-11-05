-- To List all patients sorted by age in descending order.

Use hospital;
SELECT * FROM patients
ORDER BY age DESC;

-- Show all services_weekly data sorted by week number ascending and patients_request descending.
SELECT week, patients_request
FROM services_weekly
ORDER BY week ASC, patients_request DESC;

-- To Display staff members sorted alphabetically by their names.
SELECT staff_name 
FROM staff
ORDER BY staff_name ASC;