-- 1. What is the total amount each customer spent at the restaurant?
SELECT s.customer_id, SUM(m.price) AS total_spent
FROM sales s
JOIN menu m ON s.product_id = m.product_id
GROUP BY s.customer_id
ORDER BY total_spent DESC;

-- 2. How many days has each customer visited the restaurant?
SELECT customer_id, COUNT(DISTINCT order_date) AS visit_days
FROM sales
GROUP BY customer_id;

-- 3. What was the first item from the menu purchased by each customer?
WITH first_item_purchase AS (
SELECT s.customer_id, s.order_date, s.product_id,
	RANK() OVER(PARTITION BY s.customer_id ORDER BY s.order_date) AS rank_menu
FROM sales s
)
SELECT f.customer_id, m.product_name
FROM first_item_purchase f
JOIN menu m ON f.product_id = m.product_id
WHERE rank_menu=1;

-- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?
SELECT m.product_name, COUNT(s.product_id) AS purchase_count
FROM sales s
JOIN menu m ON s.product_id = m.product_id
GROUP BY m.product_name
ORDER BY purchase_count DESC
LIMIT 1;

-- 5. Which item was the most popular for each customer?
WITH item_purchase AS (
	SELECT s.customer_id, s.product_id, COUNT(s.product_id) AS purchase_count,
		RANK() OVER(PARTITION BY s.customer_id ORDER BY COUNT(s.product_id) DESC) AS rnk
        FROM sales s
        GROUP BY s.customer_id, s.product_id
)
SELECT ip.customer_id, m.product_name, ip.purchase_count
FROM item_purchase ip
JOIN menu m ON ip.product_id = m.product_id
WHERE rnk = 1;

-- 6. Which item was purchased first by the customer after they became a member?
WITH purchase_after_membership AS (
SELECT s.customer_id, s.order_date, s.product_id,
	RANK() OVER(PARTITION BY s.customer_id ORDER BY s.order_date ASC) AS rnk
    FROM sales s
    JOIN members m ON s.customer_id = m.customer_id
    WHERE s.order_date >= m.join_date
)
SELECT p.customer_id, m.product_name
FROM purchase_after_membership p
JOIN menu m ON p.product_id = m.product_id 
WHERE rnk = 1;

-- 7. Which item was purchased just before the customer became a member?
WITH purchase_before_membership AS (
SELECT s.customer_id, s.order_date, s.product_id,
	DENSE_RANK() OVER(PARTITION BY s.customer_id ORDER BY s.order_date DESC) AS rnk
    FROM sales s
    JOIN members m ON s.customer_id = m.customer_id
    WHERE s.order_date < m.join_date
)
SELECT p.customer_id, m.product_name
FROM purchase_before_membership p
JOIN menu m ON p.product_id = m.product_id 
WHERE rnk = 1
ORDER BY customer_id;

-- 8. What is the total items and amount spent for each member before they became a member?
SELECT s.customer_id, COUNT(s.product_id) AS total_item, SUM(m.price) AS total_spent
FROM sales s
JOIN menu m ON s.product_id = m.product_id
JOIN members mem ON s.customer_id = mem.customer_id
WHERE s.order_date < mem.join_date
GROUP BY customer_id
ORDER BY customer_id;

-- 9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
SELECT s.customer_id,
		SUM(
			CASE
            WHEN m.product_name = 'sushi' THEN m.price * 20
            ELSE m.price * 10
		END) AS total_points
FROM sales s
JOIN menu m ON s.product_id = m.product_id
GROUP BY s.customer_id;

-- 10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?
WITH total_points AS (
    SELECT 
        m.customer_id, 
        m.join_date, 
        DATE_ADD(m.join_date, INTERVAL 6 DAY) AS program_last_date
    FROM members m
)
SELECT 
    s.customer_id,
    SUM(
        CASE 
            WHEN s.order_date BETWEEN t.join_date AND t.program_last_date 
                THEN men.price * 10 * 2 
            ELSE men.price * 10 
        END
    ) AS customer_points
FROM sales s
JOIN menu men ON s.product_id = men.product_id
JOIN total_points t ON s.customer_id = t.customer_id
WHERE s.order_date <= '2021-01-31'
GROUP BY s.customer_id;

-- i. Join all the things
SELECT 
    s.customer_id,
    s.order_date,
    m.product_name,
    m.price,
    mem.join_date
FROM sales s
JOIN menu m ON s.product_id = m.product_id
JOIN members mem ON s.customer_id = mem.customer_id
ORDER BY s.customer_id, s.order_date;

--- ii. Rank all the things
SELECT s.customer_id,
		SUM(m.price) AS total_spent,
        RANK() OVER(ORDER BY SUM(m.price) DESC) AS ranking
FROM sales s
JOIN menu m ON s.product_id = m.product_id
GROUP BY customer_id
ORDER BY ranking;
		