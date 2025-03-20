## Case Study Questions

1. What is the total amount each customer spent at the restaurant?
2. How many days has each customer visited the restaurant?
3. What was the first item from the menu purchased by each customer?
4. What is the most purchased item on the menu and how many times was it purchased by all customers?
5. Which item was the most popular for each customer?
6. Which item was purchased first by the customer after they became a member?
7. Which item was purchased just before the customer became a member?
8. What is the total items and amount spent for each member before they became a member?
9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?

<br>

**Bonus Questions** :
1. Join all the things
2. Rank all the things

---

### 1. What is the total amount each customer spent at the restaurant?
```sql
SELECT s.customer_id, SUM(m.price) AS total_spent
FROM sales s
JOIN menu m ON s.product_id = m.product_id
GROUP BY s.customer_id
ORDER BY total_spent DESC;
```
### Result:
| customer_id | total_spent |
| --- | --- |
| A	| 76 |
| B	| 74 |
| C	| 36 |

### 2. How many days has each customer visited the restaurant?
```sql
SELECT customer_id, COUNT(DISTINCT order_date) AS visit_days
FROM sales
GROUP BY customer_id;
```
### Result:
| customer_id | visit_days |
| --- | --- |
| A	| 4 |
| B	| 6 |
| C	| 2 |

### 3. What was the first item from the menu purchased by each customer?
```sql
WITH first_item_purchase AS (
SELECT s.customer_id, s.order_date, s.product_id,
	RANK() OVER(PARTITION BY s.customer_id ORDER BY s.order_date) AS rank_menu
FROM sales s
)
SELECT f.customer_id, m.product_name
FROM first_item_purchase f
JOIN menu m ON f.product_id = m.product_id
WHERE rank_menu=1;
```
### Result:
| customer_id | product_name |
| --- | --- |
| A	| sushi |
| A	| curry |
| B	| curry |
| C	| ramen |
| C	| ramen |

### 4. What is the most purchased item on the menu and how many times was it purchased by all customers?
```sql
SELECT m.product_name, COUNT(s.product_id) AS purchase_count
FROM sales s
JOIN menu m ON s.product_id = m.product_id
GROUP BY m.product_name
ORDER BY purchase_count DESC
LIMIT 1;
```
### Result:
| product_name | purchase_count |
| --- | --- |
| Ramen	| 8 |

### 5. Which item was the most popular for each customer?
```sql
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
```
### Result:
| customer_id | product_name | purchase_count|
| --- | --- | --- |
| A | ramen | 3 |
| B | sushi | 2 |
| B | curry | 2 |
| B | ramen | 2 |
| C | ramen | 3 |

### 6. Which item was purchased first by the customer after they became a member?
```sql
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
```
### Result:
| customer_id | product_name |
| --- | --- |
| B | sushi |
| A | curry |

### 7. Which item was purchased just before the customer became a member?

### 8. What is the total items and amount spent for each member before they became a member?

### 9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

### 10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items,           not just sushi - how many points do customer A and B have at the end of January?
