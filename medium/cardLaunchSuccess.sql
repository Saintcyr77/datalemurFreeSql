with cte1 as (Select concat(issue_month, '/', issue_year) as month_year, card_name, issued_amount from monthly_cards_issued),

cte2 as (Select card_name, issued_amount, row_number() over(partition by card_name order by month_year ) as first_month from cte1)

Select card_name, issued_amount from cte2
where first_month = 1
order by issued_amount desc