# 🛒walmart-sales-anaylsis

A full-cycle data analysis project on multi-city DMart retail sales in Gujarat, India. This project covers end-to-end analytics including data cleaning, SQL exploration, Power BI visualization, and actionable business insights.

---

## 📦 Dataset Overview

- **Domain**: walmart/Supermarket
- **Size**: 15MB, over 150k  rows
- **Scope**: Sales from 11 cities across Gujarat  
- **Features**: Product category, city, price, quantity, discount, transaction time, and final amount

---

## 🧹 Data Preparation

- Cleaned and standardized using **Pandas**
- Enhanced with additional time/date formatting
- Exported to CSV and loaded into **MySQL** and **Power BI** for querying and visualization

---

## 📊 Power BI Dashboard Highlights

- **KPIs**: Total Revenue, Avg. Total Transaction , yearly growth
- **Visuals**:  
  - Revenue by City and Category  
  - Top-selling products  
  - Discount analysis  
  - Underperforming items  
  - Hourly sales patterns

📎 *Preview available in `/visuals/` folder*

---

## 🧠 Sample Business Insights

- **Clothing** generated the highest revenue (₹82.47L) among all categories
- **Ahmedabad, Surat, and Gandhinagar** were top-performing cities
- **Discounted items like Chips and Pencils underperformed** despite high average discounts
- **Yoga Mats and Toys** showed strong sales — indicating lifestyle-oriented customer interest
- **Snacks & Grocery categories underperformed** — warrant deeper marketing focus

---

## 📌 SQL Analysis Highlights

- Over 20+ insightful queries executed, such as:
  - Top 3 products per city by revenue
  - Hourly sales trends
  - High discount vs. low sales detection
  - Revenue per unit sold
  - Outlier revenue days detection using standard deviation logic

---

## 🛠 Tech Stack

| Tool        | Use Case                   |
|-------------|----------------------------|
| Python      | Data cleaning (Pandas)     |
| MySQL       | Querying & analytics       |
| Power BI    | Interactive dashboarding   |
| Excel/CSV   | Import/export & formatting |

---

## 📁 Project Structure

