-- Display the first 5 patients from the patients table
SELECT name as patient_name from patients
LIMIT 5;

-- Show patients 11-20 using OFFSET.
SELECT name AS patient_name FROM patients
LIMIT 10 OFFSET 10;

-- Get the 10 most recent patient admissions based on arrival_date.
SELECT * FROM patients
ORDER BY arrival_date DESC
LIMIT 10;