# 🏋️‍♂️ Gym Member Retention & Churn Risk Analysis

## 📋 Project Overview
This end-to-end Business Intelligence solution enables gym managers to monitor and improve customer retention. The project identifies "At-Risk" members by cross-referencing attendance logs with financial data.

The dashboard specifically targets a critical segment: members who have been **inactive for more than 14 days** but have an **active financial investment**.

## 🛠️ Tech Stack
* **Database:** SQL Server (T-SQL)
* **Visualization:** Microsoft Power BI
* **ETL & Data Processing:** Power Query & Complex SQL Views
* **Architecture:** Relational Model (Members, Visits, Payments)

## 🏗️ Project Architecture

### 1. Data Engineering (SQL Server)
The project is built on a structured relational database to simulate a real-world production environment:
* **`Members` Table**: Profiles, subscription types, and registration dates.
* **`Visits` Table**: Attendance tracking (check-in logs).
* **`Payments` Table**: Financial history for Customer Lifetime Value (CLV) calculation.

I developed a **SQL VIEW** (`Vue_Alerte_Retention`) to automate the calculation of inactivity days using date functions (`DATEDIFF`) and to aggregate total investments per member.

### 2. Data Visualization (Power BI)
The interactive dashboard answers key business questions:
* **Revenue at Risk:** Total amount invested by inactive members (€4,736).
* **Alerted Members:** Total volume of high-priority clients to contact (24 members).
* **Subscription Segmentation:** Insight showing that **54% of the risk** comes from annual contracts.
* **Detailed Breakdown:** A comprehensive list using conditional formatting to prioritize members with the longest absences.

## 💡 Technical Challenges Resolved
* **Handling Homonyms:** Resolved a data discrepancy where members shared the same name (e.g., "Ines B."). I implemented **Distinct Count** logic using `member_id` instead of names to ensure 100% data accuracy across all visuals.
* **Global Filter Synchronization:** Applied dynamic page-level filters to ensure all KPIs and charts consistently reflect only the at-risk population.

## 🚀 How to Use
1. Run the script located in `GymRetention360_Database_Setup.sq
2. Open the `GymRetention360.pbix` file to explore the interactive report.

---
**Author:** Ali Salia – IT & Data Student
