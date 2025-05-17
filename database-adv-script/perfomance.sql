-- Step 1: Initial Query
SELECT *
FROM 
    booking 
JOIN 
    users ON booking.customer_id = user.id
JOIN 
    listing  ON booking.listing_id = listing.id
JOIN 
    payments  ON booking.id = payment.booking_id;

