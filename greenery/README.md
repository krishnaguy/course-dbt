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



### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
