EXPLAIN SELECT 
    * 
    FROM 
    booking
JOIN 
    users u ON bookin.user_id = u.id
JOIN 
    listing l ON booking.listing_id = l.id
JOIN 
    payments pay ON booking.id = pay.booking_id;


    Potential Inefficiencies

    Lack of indexes on user_id, property_id, and booking_id in respective tables can lead to full table scans.

    Unused columns being selected (e.g., entire payment details when only amount/status might be required).

    Too many JOINs if not all fields are necessary in a real-time scenario.

Refactored Query + Index Suggestions

-- Indexing (run only once)
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_payments_booking_id ON payments(booking_id);

-- Refactored Query
SELECT
    b.id AS booking_id,
    b.booking_date,
    b.check_in,
    b.check_out,
    u.name AS user_name,
    p.title AS property_title,
    pay.amount,
    pay.status
FROM
    bookings b
JOIN
    users u ON b.user_id = u.id
JOIN
    properties p ON b.property_id = p.id
JOIN
    payments pay ON b.id = pay.booking_id;


