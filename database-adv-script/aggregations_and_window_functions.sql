
----------------to find the total number of bookings made by each user
SELECT Customer_id, COUNT(*) 
FROM bookings
GROUP BY Customer_id;

------------------- to rank listing based on the total number of bookings
SELECT 
    listing_id,
    COUNT(*) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS rank
FROM booking
GROUP BY listing_id;
