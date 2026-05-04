# 🚖 Uber Operations Analytics

![Python](https://img.shields.io/badge/Python-3.10-blue?logo=python) ![MySQL](https://img.shields.io/badge/MySQL-Database-4479A1?logo=mysql) ![PowerBI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?logo=powerbi) ![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

## 📌 Project Overview

An end-to-end operational analytics project analyzing **150,000+ Uber ride records** to identify key factors affecting ride completion, cancellations, demand-supply gaps, driver performance, and revenue leakage — delivering actionable recommendations to improve efficiency and growth.

---

## 🎯 Objectives

- Identify key factors driving ride cancellations
- Analyze peak demand patterns and demand-supply gaps
- Evaluate driver performance across vehicle types and locations
- Quantify revenue loss from incomplete rides
- Provide data-driven recommendations to optimize operations

---

## 🗂️ Dataset Summary

| Property | Details |
|---|---|
| Rows | 150,000 |
| Columns | 21 |
| Numeric Columns | 9 |
| Datetime Columns | 2 |
| Missing Value Columns | 13 |
| Database | MySQL |

**Key Features:** Booking Status, Vehicle Type, Pickup/Drop Location, Avg VTAT & CTAT, Cancellation reasons (Driver & Customer), Booking Value, Ride Distance, Driver & Customer Ratings, Payment Method

---

## 🛠️ Tech Stack

| Tool | Usage |
|---|---|
| Python (Pandas, NumPy) | Data cleaning, EDA, feature engineering |
| MySQL | Structured SQL analysis |
| Power BI | 5-page interactive dashboard |
| Excel | Supporting analysis |

---

## ⚙️ Project Workflow

### 1. Data Cleaning & Preparation (Python)
- Loaded 150K records using `pandas`
- Handled missing values across 13 columns
- Renamed columns to snake_case for consistency
- Engineered `month`, `year` from date column
- Engineered `hour` from time column (then dropped time)
- Created `cancelled_ride` binary feature
- Separated numerical and categorical columns for targeted EDA
- Loaded cleaned DataFrame into MySQL for SQL analysis

### 2. SQL Analysis (MySQL)
Wrote **12 advanced queries** using window functions, CTEs, subqueries, and aggregations to answer:

| # | Business Question |
|---|---|
| 1 | Cancellation Rate by Vehicle Type |
| 2 | Peak Hour Demand |
| 3 | Revenue Contribution by Payment Method |
| 4 | High Value Customers |
| 5 | Locations with Highest Ride Distance |
| 6 | Driver vs Customer Cancellation Comparison |
| 7 | Top Customers per Month |
| 8 | Running Revenue Trend |
| 9 | Hourly Performance Comparison |
| 10 | Worst Performing Routes |
| 11 | Demand-Supply Gap Proxy |
| 12 | Revenue Loss Due to Incomplete Rides |

### 3. Dashboard (Power BI)
Built a **5-page interactive dashboard** with date-range slicers covering Overall, Vehicle Type, Revenue, Cancellation, and Ratings views.

---

## 📊 Key Findings

- **148.77K total bookings** | **92.55K successful** | **25% cancellation rate**
- **Peak demand at 6–8 PM** with 12,397 bookings/hour — critical window for driver allocation
- **Driver cancellations (27K) are 2.57x higher** than customer cancellations (10.5K) — primary reliability risk
- **₹45.8L revenue leakage** from incomplete rides vs ₹4.7Cr actual revenue (~9.7% loss)
- **Old Gurgaon has 10.29% demand-supply gap** — highest among all locations
- **UPI dominates revenue** at ₹2.33Cr, followed by Cash (₹1.29Cr)
- All vehicle types show consistent ~25% cancellation rate — systemic issue, not vehicle-specific

---

## 💡 Business Recommendations

1. **Improve Driver Supply** — Deploy more drivers in Old Gurgaon, Paharganj, Vinobapuri during peak hours
2. **Peak Hour Surge Strategy** — Refine surge pricing between 6–8 PM to balance demand-supply
3. **Reduce Driver Cancellations** — Implement accountability measures; driver cancellations are 2.57x the problem
4. **Minimize Revenue Leakage** — Address incomplete ride causes to recover ₹45.8L lost revenue
5. **Focus on High-Value Customers** — Top spender reached ₹4,987 — build a retention program
6. **Fix Worst Routes** — Jahangirpuri → Connaught Place and similar routes need operational review

---

## 📁 Repository Structure

```
uber-operations-analytics/
│
├── data/
│   └── uber_rides_data.csv
│
├── notebooks/
│   └── uber_EDA.ipynb
│
├── sql/
│   └── uber_analysis_queries.sql
│
├── dashboard/
│   └── uber_operations_dashboard.pbix
│
└── README.md
```

---

## 🖼️ Dashboard Preview

> *(Add screenshots of your Power BI dashboard pages here)*

---

## 👤 Author

**Viren**
- 📧 dagarviren015@gmail.com
- 💼 [LinkedIn](https://linkedin.com/in/viren-dagar66a2463a0)
- 🐙 [GitHub](https://github.com/Viren-Dagar)
