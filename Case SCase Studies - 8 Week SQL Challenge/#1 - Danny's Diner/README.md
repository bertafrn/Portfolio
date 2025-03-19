## [Case Study #1 : Danny's Diner](https://8weeksqlchallenge.com/case-study-1/)

<p align="center">
  <img src="https://8weeksqlchallenge.com/images/case-study-designs/1.png" alt="Danny's Diner" width="450" height="450">
</p>

## Table of Contents
- [Introduction](#introduction)
- [Problem Statement](#problem-statement)
- [Datasets Used](#datasets-used)
- [Entity Relationship Diagram](#entity-relationship-diagram)
- [Case Study Questions + Bonus Questions](#case-study-questions)

## Introduction
In early 2021, Danny opened Danny’s Diner, a small restaurant serving his three favorite foods: sushi, curry, and ramen. Now, he needs help analyzing operational data to keep his business running.

## Problem Statement
Danny wants to analyze customer data to understand their visit patterns, spending habits, and favorite menu items. These insights will help him enhance the customer experience and decide whether to expand the loyalty program.

## Datasets Used
This case study involves three main datasets:
- `sales`: Records each purchase made by customers, including the `customer_id`, `order_date`, and `product_id`, which indicates what menu items were ordered and when.
- `menu`: Links each `product_id` to its corresponding `product_name` and price, providing details about the menu items.
- `members`: Tracks when a `customer_id` joined the beta version of Danny’s Diner loyalty program through the `join_date` field.

## Entity Relationship Diagram
![image]()

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
10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not       just sushi - how many points do customer A and B have at the end of January?
    
### Bonus Questions
1. Join all the things
2. Rank all the things
