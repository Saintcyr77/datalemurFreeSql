with cte1 as (SELECT category, product, sum(spend) as total_spend FROM product_spend
where extract(year from transaction_date) = 2022
group by 1,2),

cte2 as (Select *, row_number() over(partition by category order by total_spend desc) from cte1)

Select category, product, total_spend from cte2 
where row_number<=2