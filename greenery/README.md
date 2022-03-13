### Week 1 homework
#### Question 1: How many users do we have?
#### Answer 1: 130. 
~~~~sql
select
*
from dbt_krishna_v.stg_addresses limit 100;
~~~~

#### Question 2: On average, how many orders do we receive per hour?
#### Answer 2: 7.53
~~~~sql
select
distinct status
from dbt_krishna_v.stg_orders
~~~~

#### Question 3: On average, how long does an order take from being placed to being delivered?
#### Answer 3: 3.89 days
~~~~sql
select
(sum(EXTRACT(EPOCH from (delivered_at - created_at)))/(3600*24))/count(*) as avg_delivery_time
from dbt_krishna_v.stg_orders
where status = 'delivered'
~~~~

#### Question 4: How many users have only made one purchase? Two purchases? Three+ purchases?
#### Answer 4: 25, 28 and 71 respectively
~~~~sql
with orders_per_cust as (
select
user_id
, count(*) as num_orders
from dbt_krishna_v.stg_orders
group by user_id
order by num_orders desc) 
select
sum(CASE when num_orders = 1 then 1 else 0 end) as num_cust_1_order
, sum(CASE when num_orders = 2 then 1 else 0 end) as num_cust_2_orders
, sum(CASE when num_orders > 2 then 1 else 0 end) as num_cust_ge3_orders
from orders_per_cust
~~~~

#### Question 5: On average, how many unique sessions do we have per hour?
#### Answer 5: 16.33
~~~~sql
with sessions_per_hour as (select
count(distinct session_id) as num_unique_sessions
, EXTRACT(year from created_at) as year
, extract(month from created_at) as month
, extract(day from created_at) as day
, extract(hour from created_at) as hour
from dbt_krishna_v.stg_events
group by year, month, day, hour
order by year, month, day, hour)
select
avg(num_unique_sessions)
from sessions_per_hour
~~~~
