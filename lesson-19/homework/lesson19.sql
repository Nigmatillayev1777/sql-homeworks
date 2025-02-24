
WITH ProcessTimes AS (
  SELECT 
    s.machine_id,
    s.process_id,
    e.timestamp - s.timestamp AS processing_time
  FROM Activity s
  JOIN Activity e 
    ON s.machine_id = e.machine_id 
   AND s.process_id = e.process_id
  WHERE s.activity_type = 'start'
    AND e.activity_type = 'end'
)
select machine_id, round(avg(processing_time),3) as processing_time from ProcessTimes
group by machine_id
