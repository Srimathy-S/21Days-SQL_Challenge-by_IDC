-- 1. List all unique services in the patients table.

USE hospital;
SELECT DISTINCT service
FROM patients;

-- 2. Find all unique staff roles in the hospital.

SELECT DISTINCT role AS Staff_Roles
FROM staff;

-- 3. Get distinct months from the services_weekly table.
SELECT DISTINCT month 
FROM services_weekly;