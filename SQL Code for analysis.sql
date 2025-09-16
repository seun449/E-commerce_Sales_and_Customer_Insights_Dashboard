/*INNER JOIN: Retrieve all orders with customer names, product names, and sales rep names, and the highest grossing product.*/

SELECT 
   o.order_id, 
   o.order_date, 
   c.customer_id, 
   c.first_name ||'  '|| c.last_name, 
   p.product_name,
   s.rep_name 
FROM 
    products p
INNER JOIN
       orders o
ON 
   p.product_id = o.product_id
INNER JOIN 
        customers c
ON 
   o.customer_id = c.customer_id
INNER JOIN 
      sales_reps s
ON 
   c.sales_rep_id = s.sales_rep_id
ORDER BY 
      o.order_date;

/*LEFT JOIN: List all customers with their order details, including customers who have never*/

SELECT o.order_id,
       order_date, c.customer_id, 
       c.first_name, 
       c.last_name,
       c.signup_date, 
       c.email
FROM 
     orders o
LEFT JOIN 
       customers c
ON 
   o.customer_id = c.customer_id
ORDER BY 
       o.order_date, o.order_date NULLS LAST;

/*RIGHT JOIN: Show all products and the orders placed for them (including products never sold).*/

SELECT 
     p.product_id, 
	  p.product_name, 
	  p.category, p.price,
      o.order_id, 
	  o.order_date, 
	  o.quantity, 
	  o.total_amount
FROM 
   products p
RIGHT JOIN 
      orders o
ON 
  p.product_id = o.product_id
ORDER BY 
       o.order_date, o.order_date NULLS LAST;

/*Find customers who signed up in 2023 AND have placed at least one order worth more than $200*/

SELECT 
     c.customer_id, 
	 c.first_name, 
	 c.last_name,
     c.email, 
	 c.signup_date, 
	 o.total_amount
FROM  
   orders o
JOIN 
   customers c
ON 
  o.customer_id = c.customer_id
WHERE 
    c.signup_date BETWEEN '2023-01-01' AND '2023-12-31' AND o.total_amount > 200
ORDER BY 
      c.customer_id;

/*List orders where the product category is "Electronics" OR "Accessories".*/

SELECT 
     o.order_id, 
	 p.product_id, 
	 p.category, 
	 o.quantity
FROM 
   products p
JOIN 
   orders o
ON 
  p.product_id = o.product_id
WHERE 
    p.category = 'Electronics' OR p.category = 'Accessories'
ORDER BY 
       o.quantity DESC;

/*Show customers whose sales reps are NOT assigned to the "North Region".*/

SELECT 
	s.sales_rep_id, 
	s.rep_name, s.region, 
	c.customer_id, 
	c.first_name, 
	c.last_name
FROM 
	sales_reps s
JOIN 
	customers c
ON 
	s.sales_rep_id = c.sales_rep_id
WHERE 
	s.region NOT IN ('North Region')
ORDER BY 
	c.customer_id;

/* DATE_PART: Count how many orders were placed in each month of 2024. */

SELECT 
	DATE_PART('month', order_date) AS months, 
	COUNT(*) AS order_count
FROM 
	orders
GROUP BY 
	   1
ORDER BY 
	order_count DESC;

/* DATE_TRUNC: Calculate total revenue for each quarter in 2024.*/

SELECT 
     DATE_TRUNC('quarter', order_date) AS rev_quater, 
	 SUM(total_amount) AS total_revenue
FROM 
    orders 
WHERE 
    DATE_TRUNC('quarter', order_date) BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY 
       1
ORDER BY 
      total_revenue DESC;

/* Create a column spending_category to classify customers based on their total spending: */

SELECT 
	c.customer_id, 
	c.first_name, 
	c.last_name, 
	SUM(o.total_amount) total_spent, 
       CASE 
	        WHEN SUM(o.total_amount) > 1000 THEN 'High Value'
	        WHEN SUM(o.total_amount) BETWEEN 500 AND 1000 THEN 'Medium Value'
			ELSE 'Low Value' END AS spending_category
FROM 
	orders o
JOIN 
	customers c
ON 
	o.customer_id = c.customer_id
GROUP BY 
	c.customer_id, 
	c.first_name, 
	c.last_name
ORDER BY 
	total_spent DESC;
			
/* Find all customers whose total spending is above the average spending of all customers. */

SELECT 
     c.customer_id, 
	 c.first_name, 
	 c.last_name, 
	 SUM(o.total_amount) AS total_spent
FROM 
    orders o
JOIN 
    customers c
ON 
  o.customer_id = c.customer_id
GROUP BY 
      c.customer_id, 
	  c.first_name, 
	  c.last_name
HAVING 
     SUM(o.total_amount) > (SELECT 
	                            AVG(total_spent)
                            FROM (
                                    SELECT 
								         customer_id, 
								         SUM(total_amount) AS total_spent
                                     FROM 
									     orders
                                     GROUP BY 
								           customer_id
	                              ) sub
						)  
ORDER BY 
      total_spent DESC;

								         customer_id, 
								         SUM(total_amount) AS total_spent
