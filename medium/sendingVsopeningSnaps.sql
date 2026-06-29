with cte1 as (SELECT b.age_bucket, sum(case when a.activity_type='send' then a.time_spent end) as spending_time,
sum(case when a.activity_type= 'open' then a.time_spent end) as open_time
FROM activities a join 
age_breakdown b on 
a.user_id = b.user_id
group by b.age_bucket)

Select age_bucket, round(spending_time::numeric/(spending_time+open_time)*100.0,2)as send_perc,
round(open_time::numeric/(spending_time+open_time)*100.0,2) as open_perc from 
cte1