-- Retrieve all columns from the patients table.
USE hospital;
SELECT * FROM patients;

-- Select only the patient_id, name, and age columns from the patients table.
SELECT patient_id, name, age FROM patients;

-- Display the first 10 records from the services_weekly table. 
SELECT * FROM services_weekly LIMIT 10;