-- 1.Find all weeks in services_weekly where no special event occurred.

Use hospital;

SELECT * from services_weekly
where event = 'none';

-- 2.Count how many records have null or empty event values.

SELECT count(*) AS No_of_Records     
FROM services_weekly
WHERE event IS NULL 
		or event = '';
        
-- 3.List all services that had at least one week with a special event.

SELECT DISTINCT service, week
from services_weekly
WHERE event IS NOT NULL
	OR event != 'none';