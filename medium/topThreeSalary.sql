with cte1 as (SELECT *, dense_rank() over(partition by a.department_id order by a.salary desc) FROM employee a join department b on 
a.department_id = b.department_id)

Select department_name, name, salary from cte1 
where dense_rank<=3
order by 1, salary desc, name
