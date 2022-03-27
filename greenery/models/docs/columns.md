{% docs user_id %}
A unique user_id encoded as a guid. 
{% enddocs %}

{% docs first_name %}
The first name of a user
{% enddocs %}

{% docs last_name %}
The last name of a user
{% enddocs %}

{% docs email %}
The email of a user
{% enddocs %}

{% docs phone_number %}
The phone number of a user
{% enddocs %}

{% docs address_id %}
The unique id of an address expressed as a guid
{% enddocs %}

{% docs user_created_at %}
The date on which a given user was created
{% enddocs %}

{% docs user_updated_at %}
The last date on which a given user's data was updated
{% enddocs %}


{% docs address %}
An address string excluding state, zip and country
{% enddocs %}

{% docs zipcode %}
The zipcode associated with an address. (candidate for reference data?)
{% enddocs %}

{% docs country %}
The country associated with an address. (candidate for reference data?)
{% enddocs %}

{% docs state %}
The state associated with an address. (candidate for reference data?)
{% enddocs %}


{% docs product_id %}
The unique id associated with a product expressed as a guid
{% enddocs %}

{% docs product_name %}
The description of a product
{% enddocs %}

{% docs product_price %}
The price of a product
{% enddocs %}

{% docs product_inventory %}
The amount of a product available for sale
{% enddocs %}

{% docs order_id %}
The unique id for an order expressed as a guid
{% enddocs %}

{% docs total_discount %}
The total discount applied to a given order, expressed in dollars taken away from revenue (negative)
{% enddocs %}

{% docs total_revenue %}
The total undiscounted revenue per order, expressed in dollars
{% enddocs %}

{% docs discounted_revenue %}
The total discounted revenue per order, expressed in dollars, and calculated against product price.
{% enddocs %}

{% docs cust_product_cost %}
The total cost (undiscounted) of all the products that a given customer has bought
{% enddocs %}

{% docs cust_shipping_cost %}
The total shipping cost that a given customer has incurred
{% enddocs %}

{% docs cust_order_cost %}
The total cost of all orders for a given customer net of discounts and including shipping costs
{% enddocs %}

{% docs cust_discounts %}
The total discounts that a customer has received over all orders
{% enddocs %}


{% docs cust_num_orders %}
The total number of orders that a customer has placed
{% enddocs %}

{% docs cust_num_orders_delivered %}
The total number of orders that a customer has received
{% enddocs %}

{% docs cust_num_orders_preparing %}
The total number of orders from a given customer that is in the 'preparing' status
{% enddocs %}

{% docs cust_num_orders_shipped %}
The total number of orders from a given customer that are in the 'shipped' status
{% enddocs %}


{% docs event_id %}
The unique id assigned to every event
{% enddocs  %}

{% docs session_id %}
The unique id assigned to each session
{% enddocs %}

{% docs page_url %}
A page url
{% enddocs %}

{% docs event_type  %}
User event types are tracked
{% enddocs %}

{% docs event_created_at %}
The time at which a user event was created 
{% enddocs %}

{% docs year %}
The year associated with an event_created field
{% enddocs %}

{% docs month %}
The month associated with an event_created field
{% enddocs %}

{% docs day %}
The day associated with a timestamp
{% enddocs %}

{% docs hour %}
The year associated with a timestamp
{% enddocs %}

{% docs minute %}
The minute associated with a timestamp
{% enddocs %}

{% docs second %}
The year associated with a timestamp
{% enddocs %}