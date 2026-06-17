# 🛒 Retail Sales Analysis using SQL

## 📌 Project Overview
This project simulates a real-world e-commerce database system and performs SQL-based data analysis to extract business insights.

The goal is to analyze customer behavior, product performance, and revenue trends using SQL queries.

---

## 🧠 Business Problem
An e-commerce company wants to answer:

- Which products generate the highest revenue?
- Who are the top customers?
- What are the monthly sales trends?
- Which cities generate the most revenue?

---

## 🏗️ Database Design

### Tables:
- Customers
- Products
- Orders
- Order_Items

### Relationships:
- One customer → many orders
- One order → many products

---

## 🧾 Schema

```sql
customers(customer_id, name, city)
products(product_id, product_name, category, price)
orders(order_id, customer_id, order_date)
order_items(order_item_id, order_id, product_id, quantity)
