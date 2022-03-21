### Week 2 homework
#### Question 1: Repeat Rate
#### Answer 1: 0.798
~~~~sql
select 
SUM( CASE WHEN num_orders >= 2 THEN 1.0 ELSE 0 END) as repeaters
, SUM( CASE WHEN num_orders > 0 then 1.0 else 0 END) as buyers
, SUM( CASE WHEN num_orders >= 2.0 THEN 1 ELSE 0 END)/ SUM( CASE WHEN num_orders > 0 then 1.0 else 0 END) as fraction
FROM dbt_krishna_v.fact_user_order
~~~~
#### Question 2: What drives repeat purchases?
#### Answer 2: Discounts seem to be a factor. I also would evaluate if certain products lead to repeat purchases. In addition (the usual suspects which we will not be able to see in this data) include seasonality, ratings, age, customer tenure and so on. 

#### Question 3: Mart considerations
#### Answer 3: For the core mart I thought about the dimenions of product, customer, date, address, promos. I did not implement date because it was not particularly useful at this point. I can see it being useful if we want to aggregate upto a certain time granularity. For the intermediate tables I considered one to calculate the discount that should be applied to each order. However I did not get consistent answers when I compared agains the stated order_total values in the order table. I believe this may be because prices in the product table might be current prices which may not have been in effect when the promotions were in effect or because the discount associated with the promos may have changed. For the marketing data mart I thought about customer lifetime value and engagement (total purchases, total discounts, number of orders etc. ). I should add number of distinct products. For the product facts I created one that aggregated events by the hour and reported on the number of events, number of events by type, number of unique users, number of unique users by type. The idea was to see if there are some patterns to events by time of day/month etc. 

### Week 1 homework
#### Question 1: How many users do we have?
#### Answer 1: 130. 
~~~~sql
select
count(distinct user_id)
from dbt_krishna_v.stg_users
~~~~

#### Question 2: On average, how many orders do we receive per hour?
#### Answer 2: 7.53
~~~~sql
select
count(*)/(EXTRACT(EPOCH from (MAX(created_at) - MIN(created_at)))/3600) as orders_per_hour
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
