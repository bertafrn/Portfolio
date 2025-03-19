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


### 4. What is the most purchased item on the menu and how many times was it purchased by all customers?

### 5. Which item was the most popular for each customer?

### 6. Which item was purchased first by the customer after they became a member?

### 7. Which item was purchased just before the customer became a member?

### 8. What is the total items and amount spent for each member before they became a member?

### 9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

### 10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items,           not just sushi - how many points do customer A and B have at the end of January?
