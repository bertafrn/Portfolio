## [Case Study #2 : Pizza Runner](https://8weeksqlchallenge.com/case-study-2/)

<p align="center">
<img src="https://8weeksqlchallenge.com/images/case-study-designs/2.png" alt="Pizza Runner" width="450" height="450">
</p>

## Table of Contents
-  [Introduction](#introduction)
-  [Dataset](#datasets)
-  [Entity Relationship Diagram](#entity-relationship-diagram)
-  [Case Study Solutions](#case-study-solutions)

## Introduction
Danny came across an interesting idea on Instagram: “80s Retro Styling and Pizza Is The Future!” Inspired by this, he realized that pizza alone wouldn’t be enough to secure funding for his business. So, he came up with a brilliant idea—applying the Uber-like concept to pizza delivery.

Danny started by recruiting “runners” to deliver fresh pizza from the Pizza Runner headquarters (his own home) and hired freelance developers to build a mobile app for customer orders.

## Dataset
The key datasets in this case study include:
- `runners`: Contains the registration date of each runner.
- `customer_orders`: Stores customer pizza orders, including the type of pizza, removed ingredients, and extra toppings.
- `runner_orders`: Records orders assigned to runners, including order status (completed or canceled), pickup time, delivery distance, and duration.
- `pizza_names`: Pizza Runner offers only two pizza options: Meat Lovers and Vegetarian.
- `pizza_recipes`: Lists the standard ingredients for each type of pizza.
- `pizza_toppings`: Contains a list of all available toppings along with their respective IDs.

## Entity Relationship Diagram
![Image](https://github.com/bertafrn/Portfolio/blob/main/Case%20Studies%208%20Week%20SQL%20Challenge/assets/ERD%20Pizza%20Runnerr.jpg?raw=true)

## Case Study Solutions
- [0. Data Cleaning](Data-Cleaning.md)
- [1. Pizza Metrics](1.%20Pizza-Metrics.md)
- [2. Runner and Customer Experience](2.%20Runner-and-Customer-Experience.md)
- [3. Ingredient Optimisation](3.%20Ingredient-Optimisation.md)

