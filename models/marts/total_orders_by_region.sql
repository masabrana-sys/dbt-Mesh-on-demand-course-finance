with orders as (
    select * from {{ ref('jaffle_shop','fct_orders') }}
),

agg as (
    select
        created_at,
        count(order_id) as order_count,
        sum(order_amount) as orders_revenue
    from orders 
    group by 1
)

select * from agg