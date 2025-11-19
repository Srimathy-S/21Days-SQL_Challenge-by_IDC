-- 1. Show all staff members and their schedule information (including those with no schedule entries).

Use hospital;
select s.staff_id, s.staff_name, s.role, sc.week, sc.present
from staff as s
left join staff_schedule as sc
on s.staff_id = sc.staff_id;


-- 2. List all services from services_weekly and their corresponding staff (show services even if no staff assigned).
select sw.week, s.staff_name, sw.service
from services_weekly as sw
left join staff as s
on s.service = sw.service;

-- 3. Display all patients and their service’s weekly statistics (if available).
select p.patient_id, p.name, p.service, sw.week, p.satisfaction
from patients as p
left join services_weekly sw
on p.service = sw.service;