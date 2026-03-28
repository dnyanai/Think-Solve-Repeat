SELECT 
  platform, 
  created_at::date as created_at, 
  COUNT(*) as daily_users
FROM logs 
WHERE 
  EXTRACT(YEAR FROM created_at) = 2020
GROUP BY 1, 2			