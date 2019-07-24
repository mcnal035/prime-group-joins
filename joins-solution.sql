-- Get all customers and their addresses.
SELECT * FROM customers
join addresses on customers.id = addresses.id;

-- Get all orders and their line items (orders, quantity and product).
SELECT orders.id, products.description, line_items.quantity
FROM orders
join line_items on orders.id = line_items.id
join products on products.id = line_items.id;

-- Which warehouses have cheetos?
SELECT warehouse.warehouse, products.description
from warehouse_product
join products on products.id = warehouse_product.product_id
join warehouse on warehouse.id = warehouse_product.product_id
where products.description = 'cheetos';

-- Which warehouses have diet pepsi?
SELECT warehouse.warehouse, products.description
from warehouse_product
join products on products.id = warehouse_product.product_id
join warehouse on warehouse.id = warehouse_product.warehouse_id
where products.description = 'cheetos';

-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT customers.first_name
	, customers.last_name
	, CONCAT(customers.last_name , ', ' , customers.first_name) full_name
	, COUNT(orders.id) AS orders
from customers
	join addresses on addresses.customer_id = customers.id
	join orders on orders.address_id = addresses.customer_id
Group By
	customers.first_name
	, customers.last_name;


-- How many customers do we have?
select Count(customers) 
from customers;

-- How many products do we carry?
SELECT Count(products) 
from products;

-- What is the total available on-hand quantity of diet pepsi?
SELECT count(products.description)
from warehouse_product
	join products on products.description = 'diet pepsi';

