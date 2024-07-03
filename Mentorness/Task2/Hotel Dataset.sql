-- Database Creation And Importing the CSV File.

CREATE DATABASE hotel_db;
USE hotel_db;
SELECT 
    *
FROM
    hotel_dataset
LIMIT 20;

-- Questions 

-- Q1 Total Number of Reservations

SELECT 
    COUNT(*) AS total_reservations
FROM
    hotel_dataset;

-- Q2. Most popular meal plan among guests

SELECT 
    type_of_meal_plan, COUNT(*) AS count
FROM
    hotel_dataset
GROUP BY type_of_meal_plan
ORDER BY count DESC
LIMIT 1;

-- Q3. Average price per room for reservations involving children

SELECT 
    ROUND(AVG(avg_price_per_room), 2) AS average_price_per_room
FROM
    hotel_dataset
WHERE
    no_of_children > 0;

-- Q4. Number of reservations made for the year 2018

SELECT 
    COUNT(*) AS reservations_in_2018
FROM
    hotel_dataset
WHERE
    YEAR(STR_TO_DATE(arrival_date, '%d-%m-%Y')) = 2018;

-- Q5. Most commonly booked room type

SELECT 
    room_type_reserved, COUNT(*) AS count
FROM
    hotel_dataset
GROUP BY room_type_reserved
ORDER BY count DESC
LIMIT 1;

-- Q6. Number of reservations fall on a weekend

SELECT 
    COUNT(*) AS weekend_reservations
FROM
    hotel_dataset
WHERE
    no_of_weekend_nights > 0;

-- Q7. Highest and lowest lead time for reservations

SELECT 
    MAX(lead_time) AS highest_lead_time,
    MIN(lead_time) AS lowest_lead_time
FROM
    hotel_dataset;

-- Q8. Most common market segment type for reservations

SELECT 
    market_segment_type, COUNT(*) AS count
FROM
    hotel_dataset
GROUP BY market_segment_type
ORDER BY count DESC
LIMIT 1;

-- Q9. Number of reservations with a booking status of "Confirmed"

SELECT 
    COUNT(*) AS confirmed_reservations
FROM
    hotel_dataset
WHERE
    booking_status = 'Confirmed';

-- Q10. Total number of adults and children across all reservations


SELECT 
    SUM(no_of_adults) AS total_adults,
    SUM(no_of_children) AS total_children
FROM
    hotel_dataset;

-- Q11. Average number of weekend nights for reservations involving children

SELECT 
    ROUND(AVG(no_of_weekend_nights)) AS average_weekend_nights
FROM
    hotel_dataset
WHERE
    no_of_children > 0;

-- Q12. Number of reservations made in each month of the year

SELECT 
    MONTH(STR_TO_DATE(arrival_date, '%d-%m-%Y')) AS month,
    COUNT(*) AS reservations_count
FROM
    hotel_dataset
GROUP BY month
ORDER BY month;

-- Q13. Average number of nights spent by guests for each room type

SELECT 
    room_type_reserved,
    ROUND(AVG(no_of_weekend_nights + no_of_week_nights)) AS average_nights
FROM
    hotel_dataset
GROUP BY room_type_reserved
ORDER BY average_nights DESC;


-- Q14. Most common room type and average price for that room type for reservations involving children

SELECT 
    room_type_reserved,
    COUNT(*) AS count,
    ROUND(AVG(avg_price_per_room)) AS average_price
FROM
    hotel_dataset
WHERE
    no_of_children > 0
GROUP BY room_type_reserved
ORDER BY count DESC
LIMIT 1;

-- Q15. Market segment type that generates the highest average price per room

SELECT 
    market_segment_type,
    ROUND(AVG(avg_price_per_room)) AS average_price
FROM
    hotel_dataset
GROUP BY market_segment_type
ORDER BY average_price DESC
LIMIT 1;







