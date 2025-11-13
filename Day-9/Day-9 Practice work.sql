-- 1. Extract the year from all patient arrival dates.

SELECT arrival_date,
EXTRACT(YEAR FROM arrival_date) AS arrival_year
FROM patients;

-- 2. Calculate the length of stay for each patient (departure_date - arrival_date).

SELECT arrival_date, departure_date,
datediff(departure_date, arrival_date) AS length_stay
FROM patients;

-- 3. Find all patients who arrived in a specific month.

SELECT patient_id, name,
arrival_date
FROM patients
WHERE EXTRACT(MONTH FROM arrival_date) = 5;
