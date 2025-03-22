## [Case Study #3 : Foodie Fi](https://8weeksqlchallenge.com/case-study-3/)
<p align="center">
<img src="https://8weeksqlchallenge.com/images/case-study-designs/3.png" alt="Pizza Runner" width="450" height="450">
</p>

## Table of Contents
-  [Introduction](#introduction)
-  [Dataset](#dataset)
-  [Entity Relationship Diagram](#entity-relationship-diagram)
-  [Case Study Solutions](#case-study-solutions)

## Introduction
Subscription-based businesses are very popular, and Danny saw a gap in the market. He wanted to create a streaming service focused only on food-related content—like Netflix, but just for cooking shows!

In 2020, Danny and his team launched Foodie-Fi, offering monthly and annual subscriptions that give customers unlimited access to exclusive food videos from around the world.

Danny built Foodie-Fi with a data-driven approach, ensuring that all future investments and features would be based on data. This case study explores how subscription data can help answer key business questions.

## Dataset
This case study includes two main datasets:
### 1. `Plans`
  - `Basic Plan`: Limited access, only streaming, $9.90/month.
  - `Pro Plan`: Unlimited streaming & downloads, $19.90/month or $199/year.
  - `Trial Plan`: 7-day free trial, which automatically switches to the Pro plan unless canceled or changed.
  - `Churn Plan`: When a customer cancels, they are placed on this plan (no charge), but they keep access until the billing         period ends.

### 2. `Subscriptions`
If a customer downgrades or cancels, the current plan remains active until the period ends.
Upgrades from Basic to Pro or Annual Pro take effect immediately.
When a customer cancels, they keep access until the billing cycle ends, but the cancellation date is recorded as the start of the Churn plan.

## Entity Relationship Diagram
![Image](https://github.com/bertafrn/Portfolio/blob/main/Case%20Studies%208%20Week%20SQL%20Challenge/assets/ERD%20Foodie%20Fi.png?raw=true)

## Case Study Solutions
- [1. Customer Journey](1.%20Customer-Journey.md)
- [2. Data Analysis](2.%20Data-Analysis.md)
- [3. Challenge Payment Question](3.%20Challenge-Payment.md)
- [4. Outside the Box Questions](4.%20Outside-the-Box-Questions.md)




