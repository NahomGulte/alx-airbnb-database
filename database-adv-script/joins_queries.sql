----the inner join of the user table and the booking table
SELECT customer.name, listing_id.
FROM booking
INNER JOIN Users ON Users.Customer_id = booking.Customer_id;

----the right join of the booking table and the payment table

SELECT customer.name, status,transaction_ref.
FROM payment
INNER JOIN Booking ON Booking.booking_id = payment.Customer_id;

----the Left join of the user table and the Listing table
SELECT title, Discription.
FROM booking
INNER JOIN Users ON Users.user_id = Listing.Created_by;




