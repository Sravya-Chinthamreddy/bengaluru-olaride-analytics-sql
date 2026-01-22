/* ======================================================
   PROJECT: RideInsights 50K: Decoding Bengaluru’s Ola Patterns with SQL
   Description: SQL Exploratory Data Analysis (EDA)
   Dataset: Bengaluru_Ola_Booking_Data.csv
   ====================================================== */


/* ------------------------------------------------------
   STEP 1: CREATE DATABASE AND TABLE
   ------------------------------------------------------ */

-- Create Database
CREATE DATABASE IF NOT EXISTS Oladb;

-- Use the Database
USE Oladb;

-- Create the main table (schema example)
CREATE TABLE ola_booking_table (
    Date DATE,
    Time TIME,
    Booking_ID VARCHAR(20),
    Booking_Status VARCHAR(50),
    Customer_ID VARCHAR(20),
    Vehicle_Type VARCHAR(50),
    Pickup_Location VARCHAR(100),
    Drop_Location VARCHAR(100),
    Avg_VTAT FLOAT,
    Avg_CTAT FLOAT,
    Cancelled_Rides_by_Customer VARCHAR(10),
    Reason_for_Cancelling_by_Customer VARCHAR(255),
    Cancelled_Rides_by_Driver VARCHAR(10),
    Reason_for_Cancelling_by_Driver VARCHAR(255),
    Incomplete_Rides VARCHAR(10),
    Incomplete_Rides_Reason VARCHAR(255),
    Booking_Value DECIMAL(10,2),
    Payment_Method VARCHAR(50),
    Ride_Distance FLOAT,
    Driver_Ratings FLOAT,
    Customer_Rating FLOAT
);

-- Note: Use MySQL Workbench “Table Data Import Wizard” to load CSV data


/* ------------------------------------------------------
   STEP 2: BASIC DATA CHECKS
   ------------------------------------------------------ */

-- View all data
SELECT * FROM ola_booking_table LIMIT 10;

-- Check total number of records
SELECT COUNT(*) AS total_rows FROM ola_booking_table;

-- Check distinct vehicle types
SELECT DISTINCT Vehicle_Type FROM ola_booking_table;

-- Check distinct booking statuses
SELECT DISTINCT Booking_Status FROM ola_booking_table;


/* ------------------------------------------------------
   STEP 3: EXPLORATORY DATA ANALYSIS (EDA)
   ------------------------------------------------------ */

-- Query 1: Retrieve all successful bookings
SELECT * 
FROM ola_booking_table 
WHERE Booking_Status = 'Success';


-- Query 2: Find the average ride distance for each vehicle type
SELECT Vehicle_Type, 
       AVG(Ride_Distance) AS avg_distance 
FROM ola_booking_table 
GROUP BY Vehicle_Type;


-- Query 3: Get total number of cancelled rides by customers
SELECT COUNT(*) AS cancelled_by_customer_count 
FROM ola_booking_table 
WHERE Booking_Status = 'Cancelled by Customer';


-- Query 4: List the top 5 customers who booked the most rides
SELECT Customer_ID, 
       COUNT(Booking_ID) AS total_rides 
FROM ola_booking_table 
GROUP BY Customer_ID 
ORDER BY total_rides DESC 
LIMIT 5;


-- Query 5: Get the number of rides cancelled by drivers due to personal/car issues
SELECT COUNT(*) AS driver_cancel_personal_issues
FROM ola_booking_table 
WHERE Reason_for_Cancelling_by_Driver = 'Personal & Car related issue';


-- Query 6: Find the maximum and minimum driver ratings for Prime Sedan bookings
SELECT MAX(Driver_Ratings) AS max_rating, 
       MIN(Driver_Ratings) AS min_rating 
FROM ola_booking_table 
WHERE Vehicle_Type = 'Prime Sedan';


-- Query 7: Retrieve all rides where payment was made using UPI
SELECT * 
FROM ola_booking_table 
WHERE Payment_Method = 'UPI';


-- Query 8: Find the average customer rating per vehicle type
SELECT Vehicle_Type, 
       AVG(Customer_Rating) AS avg_customer_rating 
FROM ola_booking_table 
GROUP BY Vehicle_Type;


-- Query 9: Calculate the total booking value of successfully completed rides
SELECT SUM(Booking_Value) AS total_successful_revenue 
FROM ola_booking_table 
WHERE Booking_Status = 'Success';


-- Query 10: List all incomplete rides along with their reasons
SELECT Booking_ID, 
       Incomplete_Rides_Reason 
FROM ola_booking_table 
WHERE Incomplete_Rides = 'Yes';


/* ------------------------------------------------------
   STEP 4: ADDITIONAL INSIGHTS (OPTIONAL)
   ------------------------------------------------------ */

-- Success vs Cancelled Booking Count
SELECT Booking_Status, COUNT(*) AS total_count
FROM ola_booking_table
GROUP BY Booking_Status;

-- Day-wise booking trend
SELECT Date, COUNT(*) AS total_bookings
FROM ola_booking_table
GROUP BY Date
ORDER BY Date;

-- Payment method usage distribution
SELECT Payment_Method, COUNT(*) AS total_payments
FROM ola_booking_table
GROUP BY Payment_Method;

-- Vehicle Type usage count
SELECT Vehicle_Type, COUNT(*) AS ride_count
FROM ola_booking_table
GROUP BY Vehicle_Type;

-- Average driver rating overall
SELECT AVG(Driver_Ratings) AS avg_driver_rating
FROM ola_booking_table;

-- Average customer rating overall
SELECT AVG(Customer_Rating) AS avg_customer_rating
FROM ola_booking_table;


/* ------------------------------------------------------
   STEP 5: BUSINESS METRICS SUMMARY
   ------------------------------------------------------ */

-- Total revenue (all bookings)
SELECT SUM(Booking_Value) AS total_revenue 
FROM ola_booking_table;

-- Total distance travelled (successful rides)
SELECT SUM(Ride_Distance) AS total_distance 
FROM ola_booking_table 
WHERE Booking_Status = 'Success';

-- Average booking value
SELECT AVG(Booking_Value) AS avg_booking_value 
FROM ola_booking_table;

-- Total unique customers
SELECT COUNT(DISTINCT Customer_ID) AS unique_customers 
FROM ola_booking_table;


/* ------------------------------------------------------
   END OF SCRIPT
   ------------------------------------------------------ */
