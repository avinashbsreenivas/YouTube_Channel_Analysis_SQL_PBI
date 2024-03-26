-- 3. TOP 10 CHANNEL TYPES BY VIEWS

select channel_type, sum(`video views`) as total_views
from `global youtube statistics`
group by 1
order by 2 desc
limit 10