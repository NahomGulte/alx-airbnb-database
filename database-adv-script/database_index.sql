CREATE INDEX idx_bookings_listing_id ON bookings(listing_id);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_created_at ON bookings(created_at);
CREATE INDEX idx_listings_title ON listings(title);
CREATE INDEX idx_bookings_listing_date ON bookings(listing_id, created_at);


