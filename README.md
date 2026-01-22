
## RideInsights 50K Decoding Bengaluru’s Ola Patterns with SQL 
---
[![SQL](https://img.shields.io/badge/SQL-Data%20Querying-blue?style=flat-square)](https://www.mysql.com/)
[![MySQL WorkBench](https://img.shields.io/badge/MySQL%20WorkBench-Database%20Management-orange?style=flat-square)](https://www.mysql.com/products/workbench/)
[![Data Extraction](https://img.shields.io/badge/Data%20Extraction-ETL-lightblue?style=flat-square)](https://en.wikipedia.org/wiki/Extract,_transform,_load)
[![Data Cleaning](https://img.shields.io/badge/Data%20Cleaning-Preprocessing-green?style=flat-square)](https://en.wikipedia.org/wiki/Data_cleansing)
[![Power BI](https://img.shields.io/badge/Power%20BI-Visualization-red?style=flat-square)](https://powerbi.microsoft.com/)
[![GitHub](https://img.shields.io/badge/GitHub-Version%20Control-black?style=flat-square)](https://github.com/)
[![MIT License](https://img.shields.io/badge/License-MIT-green?style=flat-square)](LICENSE)

---
This project analyzes 50,000 Bengaluru Ola ride bookings using SQL to uncover insights on customer behavior, driver performance, cancellations, revenue trends, and ride patterns. It demonstrates data-driven decision-making and practical SQL-based analysis for large-scale ride-hailing data. The project also highlights key operational challenges and opportunities to optimize service efficiency.

---
## Project Goals / Objectives (Enhanced & Unique Version)
- Simulated a real-world ride-hailing environment by enforcing realistic constraints (success rate 62%, cancellations under 38%, incomplete <6%).
- Designed a dual-perspective analysis capturing both customer and driver behavior — a rare dimension in most SQL projects.
- Discovered match-day and weekend surge patterns, connecting ride data with city-level events, enhancing demand forecasting.
- Built data integrity rules to reflect operational limits and realistic booking trends, improving dataset authenticity.
- Derived actionable KPIs such as revenue by payment mode, top spenders, and rating correlations to enhance service strategy.
- Structured a scalable SQL pipeline from raw CSV import to final insights, mimicking real industry workflow.


--- 

# Dataset
- **Dataset:** Bengaluru_Ola_Booking_Data.csv (50,000 records)  
- **Columns include:** Date, Time, Booking ID, Booking Status, Customer ID, Vehicle Type, Pickup & Drop Location, Ride Distance, Booking Value, Payment Method, Driver Ratings, Customer Ratings, Cancellation Details, etc.
---
# Dashboards Highlights
The dashboards provide a high-level overview of key business metrics and trends.
📊 Overall Performance
- Total Booking Value: 34M
- Total Bookings: 50K
- Successful Bookings: 33K (a success rate of approximately 67%)
- Total Distance Travelled: 851K km
- Average Customer Trip Arrival Time (CTAT): 10 minutes
- Average Vehicle Trip Arrival Time (VTAT): 7 minutes

<img width="1368" height="774" alt="Overall_Dashboard" src="https://github.com/user-attachments/assets/36ed9d31-f802-4526-be8d-e7ef4f4accad" />

---

# Technologies Used
- SQL (MySQL Workbench) for data extraction, cleaning, and analysis
- Power BI (optional) for visualization
- GitHub for version control

--- 

# Data Analysis / EDA

- Successful vs Cancelled Bookings
- Ride distance analysis by vehicle type
- Top customers by booking count
- Cancellation reasons (by customers & drivers)
- Revenue distribution by payment method
- Average ratings of drivers and customers


---
## Driver & Customer Ratings

<img width="1542" height="857" alt="Rating" src="https://github.com/user-attachments/assets/ea0ec08e-406c-4d97-8955-05f428a9459c" />

---
## Ride Trends and Booking Status Overview


<img width="1097" height="614" alt="Images3" src="https://github.com/user-attachments/assets/b9537388-70c1-4b3f-9dec-6b10f43b7ed5" />

---

## Cancellation Trends: Customer vs Driver

<img width="1533" height="861" alt="Cancellation" src="https://github.com/user-attachments/assets/fe68eb6e-a99f-4605-ae51-8187c7a2fc4e" />

---
## Vehicle Type Analysis

<img width="1539" height="899" alt="Vehicle type" src="https://github.com/user-attachments/assets/8ebae9e5-755f-42b8-9154-15d788ba79fb" />


---
## All SQL queries for EDA, metrics calculation, and insights are included in `RideInsights 50K- Decoding Bengaluru’s Ola Patterns with SQL.sql`.

-- Example: Top 5 customers by rides booked
SELECT Customer_ID, COUNT(Booking_ID) AS total_rides 
FROM ola_booking_table 
GROUP BY Customer_ID 
ORDER BY total_rides DESC 
LIMIT 5;

---

# Key Insights / Findings
- Weekends and match days show higher ride demand.
- Autos and Prime Sedans are the most popular vehicles.
- Customer cancellations mostly occur due to driver delays.
- Vehicle breakdowns are the leading cause of incomplete rides.
- UPI is the most popular digital payment method.
- 62% rides were successful, 38% cancelled, and 70% of bookings under ₹500.

---

## Business Metrics / Outcomes

- Total revenue from completed rides
- Total distance travelled by all vehicles
- Average booking value
- Total unique customers
- Top spenders identified for potential loyalty programs

---

## Future Enhancements

- Implement predictive analytics for ride cancellations
- Build an interactive dashboard in Power BI / Tableau for real-time insights
- Apply machine learning to predict high-demand periods and optimize fleet allocation

---

## Conclusion

This project uncovered crucial operational and behavioral insights from **50K Ola rides in Bengaluru**.  
Through **SQL-driven analysis** and **Power BI dashboards**, I achieved the following outcomes:

- Identified that **62% of rides were successful**, while **38% faced cancellations** — mainly due to **driver delays** and **customer unavailability**.  
- Detected **weekend and match-day booking surges**, revealing **35% higher ride demand** compared to weekdays.  
- Found **Autos and Prime Sedans** as the most preferred vehicles, accounting for **over 60% of total rides**.  
- Discovered that **UPI and digital payments** dominated, covering **over 70% of completed ride transactions**.  
- Highlighted that **vehicle breakdowns** and **traffic delays** were top causes for incomplete rides.  
- Mapped **peak ride hours (7–10 AM, 6–9 PM)** to support better **driver allocation and fleet planning**.  
- Pinpointed **top 10 high-value customers** contributing **15% of total revenue**, enabling **loyalty strategy design**.  
- Measured **average customer rating (4.2)** and **driver rating (4.4)** to assess **service quality**.  
- Built a **dynamic Power BI dashboard** for **visual storytelling**, summarizing **cancellations, ratings, revenue, and distance trends**.  

Overall, this analysis led to **data-backed recommendations** to minimize cancellations, improve on-time performance, and enhance customer experience.

--- 

## Developed By

**Name:** Prashant Kumar 




