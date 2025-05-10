INSERT INTO customer (name, email, password_hash, user_type, email_verified)
VALUES 
('Alice Johnson', 'alice@example.com', 'hashed_password_1', 'host', TRUE),
('Bob Smith', 'bob@example.com', 'hashed_password_2', 'guest', TRUE),
('Charlie Daniel', 'charlie@example.com', 'hashed_password_3', 'guest', FALSE);


INSERT INTO payments (booking_id, amount, currency, status, transaction_ref)
VALUES
(1, 300.00, 'USD', 'completed', 'TXN123456'),
(2, 110.00, 'USD', 'pending', NULL);
