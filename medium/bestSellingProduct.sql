with cte1 as (SELECT a.product_id, a.category_name, a.product_name, sum(sales_quantity) as total_sales, rating  FROM products a JOIN
product_sales b on 
a.product_id = b.product_id
group by 1,2,3,rating),

cte2 as (Select category_name, max(total_sales) as max_sale, max(rating) as max_rating from cte1
group by 1)

Select a.category_name, a.product_name from cte1 a 
join cte2 b on 
a.category_name = b.category_name
where b.max_Sale = a.total_sales and b.max_rating = a.rating
order by 1,2
 