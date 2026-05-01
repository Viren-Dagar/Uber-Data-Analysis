create database uber;
use uber;
show tables;
-- 1. Cancellation Rate by Vehicle Type
SELECT 
    vehicle_type,
    COUNT(*) AS total_bookings,
    SUM(CASE WHEN booking_status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled,
    ROUND(100.0 * SUM(CASE WHEN booking_status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(*), 2) AS cancellation_rate
FROM data
GROUP BY vehicle_type;
-- 2. Peak Hour Demand
SELECT 
    hour,
    COUNT(*) AS total_bookings
FROM data
GROUP BY hour
ORDER BY total_bookings DESC
LIMIT 6;
-- 3. Revenue Contribution by Payment Method
SELECT 
    payment_method,
    SUM(booking_value) AS total_revenue
FROM data
GROUP BY payment_method
ORDER BY total_revenue DESC;
-- 4. High Value Customers
SELECT customer_id, SUM(booking_value) AS total_spend
FROM data
GROUP BY customer_id
HAVING SUM(booking_value) > (
    SELECT AVG(total_spend)
    FROM (
        SELECT customer_id, SUM(booking_value) AS total_spend
        FROM data
        GROUP BY customer_id
    ) t
)order by total_spend desc;
-- 5. Locations with Highest Ride Distance
SELECT 
    pickup_location,
    AVG(ride_distance) AS avg_distance
FROM data
GROUP BY pickup_location
ORDER BY avg_distance DESC
LIMIT 10;
-- 6. Driver vs Customer Cancellation Comparison
SELECT 
    SUM(CASE WHEN booking_status = 'Cancelled by Customer' THEN 1 ELSE 0 END) AS customer_cancel,
    SUM(CASE WHEN booking_status = 'Cancelled by Driver' THEN 1 ELSE 0 END) AS driver_cancel
FROM data;
-- 7. Top Customers per Month
SELECT *
FROM (
    SELECT 
        customer_id,
		month,
        SUM(booking_value) AS total_spend,
        RANK() OVER (PARTITION BY month  ORDER BY SUM(booking_value) DESC) AS rnk
    FROM data
    GROUP BY customer_id, month
) t
WHERE rnk <= 3;
-- 8. Running Revenue Trend
SELECT 
	date,
    SUM(booking_value) AS daily_revenue,
    SUM(SUM(booking_value)) OVER (ORDER BY DATE) AS cumulative_revenue
FROM data
GROUP BY date
ORDER BY date;
-- 9. Hourly Performance Comparison
SELECT 
    hour,
    avg_value,
    AVG(avg_value) OVER () AS overall_avg
FROM (
    SELECT 
		hour,
        AVG(booking_value) AS avg_value
    FROM data
    GROUP BY hour
) t;
-- 10. Worst Performing Routes
SELECT 
    pickup_location,
    drop_location,
    COUNT(*) AS total_rides,
    AVG(driver_ratings) AS avg_rating,
    SUM(CASE WHEN booking_status LIKE 'Cancelled%' THEN 1 ELSE 0 END) AS cancellations
FROM data
GROUP BY pickup_location, drop_location
HAVING COUNT(*) > 5
ORDER BY cancellations DESC, avg_rating ASC;
-- 11. Demand-Supply Gap Proxy
SELECT 
    pickup_location,
    COUNT(*) AS total_requests,
    SUM(CASE WHEN booking_status = 'No Driver Found' THEN 1 ELSE 0 END) AS no_driver,
    ROUND(100.0 * SUM(CASE WHEN booking_status = 'No Driver Found' THEN 1 ELSE 0 END) / COUNT(*),2) AS gap_percent
FROM data
GROUP BY pickup_location
ORDER BY gap_percent DESC;
-- 12. Revenue Loss Due to Incomplete Rides
SELECT 
    SUM(CASE WHEN booking_status NOT LIKE 'Completed%' THEN booking_value ELSE 0 END) AS revenue_loss,
    SUM(CASE WHEN booking_status LIKE 'Completed%' THEN booking_value ELSE 0 END) AS actual_revenue
FROM data;




