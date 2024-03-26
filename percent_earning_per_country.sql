-- 2 	TOP 8 COUNTRIES BASED ON PERCENT PAY

with percent_per_country as(
select 
	Country,
    round(sum(highest_yearly_earnings), 0) as earning_per_country
from `global youtube statistics`
group by 1
order by 2 desc
limit 10
)
select 
	sum(earning_per_country) as total_earning_per_country,
    round(1.0 * sum(case when Country = 'United States' then earning_per_country else 0 end)/nullif(sum(earning_per_country), 0) * 100, 2) as percent_earning_US,
    round(1.0 * sum(case when Country = 'United Kingdom' then earning_per_country else 0 end)/nullif(sum(earning_per_country), 0) * 100, 2) as percent_earning_UK,
    round(1.0 * sum(case when Country  = 'United Arab Emirates' then earning_per_country else 0 end)/nullif(sum(earning_per_country), 0) * 100, 2) as percent_earning_UAE,
    round(1.0 * sum(case when Country  = 'South Korea' then earning_per_country else 0 end)/nullif(sum(earning_per_country), 0) * 100, 2) as percent_earning_Korrea,
    round(1.0 * sum(case when Country  = 'Russia' then earning_per_country else 0 end)/nullif(sum(earning_per_country), 0) * 100, 2) as percent_earning_Russia,
    round(1.0 * sum(case when Country  = 'Argentina' then earning_per_country else 0 end)/nullif(sum(earning_per_country), 0) * 100, 2) as percent_earning_Arg,
    round(1.0 * sum(case when Country  = 'Pakistan' then earning_per_country else 0 end)/nullif(sum(earning_per_country), 0) * 100, 2) as percent_earning_Pak,
    round(1.0 * sum(case when Country  = 'Indonesia' then earning_per_country else 0 end)/nullif(sum(earning_per_country), 0) * 100, 2) as percent_earning_Indonesia,
    round(1.0 * sum(case when Country  = 'India' then earning_per_country else 0 end)/nullif(sum(earning_per_country), 0) * 100, 2) as percent_earning_India,
    round(1.0 * sum(case when Country  = 'Brazil' then earning_per_country else 0 end)/nullif(sum(earning_per_country), 0) * 100, 2) as percent_earning_Brazil
from percent_per_country

-- 'United States',
-- 'United Kingdom',
-- 'United Arab Emirates',
-- 'South Korea',
-- 'Russia',
-- 'Pakistan',
-- 'Indonesia',
-- 'India',
-- 'Brazil',
-- 'Argentina'