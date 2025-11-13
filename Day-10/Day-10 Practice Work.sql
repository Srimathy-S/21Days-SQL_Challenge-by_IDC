-- 1. Categorise patients as 'High', 'Medium', or 'Low' satisfaction based on their scores.

SELECT name, satisfaction,
CASE 
	WHEN satisfaction >=90 THEN 'High'
    WHEN satisfaction >=75 THEN 'Medium'
    ELSE 'Low'
    END AS Satisfaction_Category
    FROM patients;
    
-- 2. Label staff roles as 'Medical' or 'Support' based on role type.

SELECT staff_name, role,
CASE 
	WHEN role = 'doctor' THEN 'Medical'
    ELSE 'Support'
    END AS Staff_role_type
FROM staff;
    
-- 3. Create age groups for patients (0-18, 19-40, 41-65, 65+).

SELECT name, age,
CASE
	WHEN age BETWEEN 0 AND 18 THEN 'Child'
    WHEN age BETWEEN 19 AND 40 THEN 'Young Adult'
    WHEN age BETWEEN 41 AND 65 THEN 'Middle Aged'
    ELSE 'Senior'
  END AS age_group
FROM patients;