--------------Before Partitioning:


EXPLAIN ANALYZE
SELECT * FROM bookings_backup
WHERE check_in BETWEEN '2024-06-01' AND '2024-06-30';



--------------------After Partitioning:
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE check_in BETWEEN '2024-06-01' AND '2024-06-30';

