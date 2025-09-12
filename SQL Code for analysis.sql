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
       o.order_date, o.order_date NULLS LAST;
