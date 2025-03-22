## [Case Study #4 : Data Bank](https://8weeksqlchallenge.com/case-study-4/)
<p align="center">
<img src="https://8weeksqlchallenge.com/images/case-study-designs/4.png" alt="Data Bank" width="450" height="450">
</p>

## Table of Contents
-  [Introduction](#introduction)
-  [Dataset](#dataset)
-  [Entity Relationship Diagram](#entity-relationship-diagram)
-  [Case Study Solutions](#case-study-solutions)

## Introduction
Danny wanted to combine modern banking, cryptocurrency, and data, so he created Data Bank—a digital bank with a highly secure distributed data storage system.

At Data Bank, customers get cloud storage based on the amount of money in their accounts. However, the business model has some unique features, and the team needs your help!

The management wants to grow their customer base while also understanding how much data storage their users will need.

This case study focuses on calculating key metrics, analyzing growth, and using data insights to improve future planning and decision-making.

## Dataset
This case study includes three key datasets:
1. `Regions` = Similar to how cryptocurrency platforms operate, Data Bank runs on a network of nodes that store both money and data worldwide. In traditional banking terms, these nodes are like bank branches located in different regions.
This table contains:
    - `region_id` – Unique identifier for each region.
    - `region_name` – Name of the region.
      
2. `Customer Nodes` = Customers are assigned to different nodes based on their region.
The system randomly distributes customers across nodes, ensuring that their money and data are securely stored.
These assignments change frequently to reduce the risk of hacking and protect customer assets.
This table tracks which node holds each customer’s cash and data at any given time.

3. `Customer Transactions` = Records all financial activities of customers using their Data Bank debit card.
This includes:
    - `Deposits` – When customers add money to their account.
    - `Withdrawals` – When customers take out money.
    - `Purchases` – When customers use their debit card for transactions.

## Entity Relationship Diagram
![Image](https://github.com/bertafrn/Portfolio/blob/main/Case%20Studies%208%20Week%20SQL%20Challenge/assets/ERD%20Data%20Bank.png?raw=true)

## Case Study Solutions
- [1. Customer Nodes Exploration](1.%20Customer-Nodes-Exploration.md)
- [2. Customer Transactions](2.%20Customer-Transactions.md)
- [3. Data Allocation](3.%20Data-Allocation.md)
- [4. Extra Challenge](4.%20Extra-Challenge.md)
- [5. Extension Request](5.%20Extension-Request.md)
