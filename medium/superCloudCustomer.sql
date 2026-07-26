with cte as (Select distinct count(product_category) from products),

cte2 as (SELECT a.customer_id, count(distinct b.product_category) as uniq_prod FROM customer_contracts a join 
products b on 
a.product_id = b.product_id
group by a.customer_id)

Select customer_id from cte2 where uniq_prod = (Select  count( distinct product_category) from products)
