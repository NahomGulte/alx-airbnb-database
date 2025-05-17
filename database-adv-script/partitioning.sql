-- Step 1: Rename existing bookings table for backup
ALTER TABLE bookings RENAME TO bookings_backup;

-- Step 2: Create a new partitioned bookings table
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    booking_date DATE NOT NULL,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    status VARCHAR(50),
    -- Add other relevant columns
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT fk_property FOREIGN KEY (property_id) REFERENCES properties(id)
) PARTITION BY RANGE (check_in);

-- Step 3: Create partitions (example by year)
CREATE TABLE bookings_2023 PARTITION OF bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Step 4: Insert data back from backup if needed
-- INSERT INTO bookings SELECT * FROM bookings_backup;

-- Step 5: Indexes for partitions
CREATE INDEX idx_bookings_2023_check_in ON bookings_2023(check_in);
CREATE INDEX idx_bookings_2024_check_in ON bookings_2024(check_in);
CREATE INDEX idx_bookings_2025_check_in ON bookings_2025(check_in);

