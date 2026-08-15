with cte1 as (SELECT CAST(measurement_time AS date) AS measurement_day, row_number() over(partition by Date(measurement_time) order by measurement_time) as order_val, measurement_value
from measurements)

Select measurement_day, sum(case when order_val%2!=0 then measurement_value end) as odd_sum,
sum(case when order_val%2=0 then measurement_value end) as even_sum from cte1
group by 1

