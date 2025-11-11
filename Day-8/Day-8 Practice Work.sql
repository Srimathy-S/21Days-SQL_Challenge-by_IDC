-- 1. Convert all patient names to uppercase.

SELECT UPPER(name) AS patients_name
FROM patients;

-- 2. Find the length of each staff member's name.

SELECT staff_name,
LENGTH(staff_name) AS Name_length
FROM staff;

-- 3. Concatenate staff_id and staff_name with a hyphen separator.

SELECT staff_id, staff_name,
CONCAT(staff_id, ' - ', staff_name) AS staff_info
FROM staff;