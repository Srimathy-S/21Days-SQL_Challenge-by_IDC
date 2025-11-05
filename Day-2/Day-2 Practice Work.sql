-- To Find all patients who are older than 60 years.
Use hospital;
Select * from patients where age>60;

-- Retrieve all staff members who work in the 'Emergency' service.
Select staff_name from staff where service = 'Emergency';

-- To List all weeks where more than 100 patients requested admission in any service.
Select service from services_weekly where patients_request>100;


