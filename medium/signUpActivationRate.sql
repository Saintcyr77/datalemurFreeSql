with cte1 as (SELECT sum(case when b.signup_action = 'Confirmed' then 1 else 0 end) as total_signups, count(*) as total_users FROM emails a 
join texts b on 
a.email_id = b.email_id)

Select round(total_signups::numeric/total_users,2) as confirm_rate  from cte1