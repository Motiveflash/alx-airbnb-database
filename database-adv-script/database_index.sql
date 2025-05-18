-- Index for JOIN between bookings and users
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index for JOIN between bookings and properties
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index for filtering bookings by start_date (used in WHERE and range queries)
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- Index for filtering bookings by status (e.g., 'confirmed')
CREATE INDEX idx_bookings_status ON bookings(status);

-- Index on reviews.property_id for aggregating ratings
CREATE INDEX idx_reviews_property_id ON reviews(property_id);

-- Index on properties.id (primary key but explicitly stating if needed)
CREATE INDEX idx_properties_id ON properties(id);

-- Composite index: For optimized date + user filtering (optional advanced)
CREATE INDEX idx_bookings_user_date ON bookings(user_id, start_date);
-- Composite index: For optimized property + date filtering (optional advanced)
CREATE INDEX idx_bookings_property_date ON bookings(property_id, start_date);