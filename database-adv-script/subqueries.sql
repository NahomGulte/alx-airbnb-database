--------------the average of rating---------------------- 
SELECT * 
FROM listing
WHERE HAVING avg(*) > 4 GROUP BY rating;

------------ the counting of booking having less than 3
SELECT *
FROM users
WHERE (
    SELECT COUNT(*)
    FROM bookings
    WHERE booking.Customer_id = Customer.id
)
