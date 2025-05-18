-- Step 1: Create indexes on commonly used columns

-- Index for faster JOIN between bookings and users
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings(user_id);

-- Index for JOIN between bookings and properties
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON bookings(property_id);

-- Index for range queries on booking start dates
CREATE INDEX IF NOT EXISTS idx_bookings_start_date ON bookings(start_date);

-- Index for filtering confirmed bookings
CREATE INDEX IF NOT EXISTS idx_bookings_status ON bookings(status);

-- Index on reviews to support property-based aggregation
CREATE INDEX IF NOT EXISTS idx_reviews_property_id ON reviews(property_id);

-- Optional composite index for frequent query combinations
CREATE INDEX IF NOT EXISTS idx_bookings_user_status_date ON bookings(user_id, status, start_date);

-- Step 2: EXPLAIN ANALYZE before and after indexing

-- Analyze query that filters and joins user bookings
EXPLAIN ANALYZE
SELECT
    b.id AS booking_id,
    u.name AS user_name,
    b.start_date,
    b.end_date,
    b.status
FROM bookings b
JOIN users u ON b.user_id = u.id
WHERE b.status = 'confirmed'
  AND b.start_date >= '2024-01-01';
