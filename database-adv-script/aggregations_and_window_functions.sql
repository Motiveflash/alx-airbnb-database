-- Query 1: Complex Aggregation

--Aggregate user booking metrics for confirmed bookings in the past year
SELECT
    u.id AS user_id,
    u.name AS user_name,
    COUNT(b.id) AS total_bookings,
    -- Calculate total nights stayed (end_date - start_date)
    SUM(DATEDIFF(b.end_date, b.start_date)) AS total_nights_stayed,
    -- Total amount is calculated as price per night × number of nights
    SUM(p.price_per_night * DATEDIFF(b.end_date, b.start_date)) AS total_revenue_generated
FROM users u
-- Join bookings to get user activity
JOIN bookings b ON u.id = b.user_id
-- Join properties to calculate revenue
JOIN properties p ON b.property_id = p.id
-- Consider only confirmed bookings from the past year
WHERE b.status = 'confirmed'
  AND b.start_date >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
GROUP BY u.id, u.name
HAVING total_bookings >= 1
ORDER BY total_revenue_generated DESC;


-- Query 2: Complex Window Function

--Rank properties by number of recent bookings and show % share of all bookings
WITH recent_bookings AS (
    -- Step 1: Filter bookings to only confirmed ones in the last 6 months
    SELECT
        b.id,
        b.property_id
    FROM bookings b
    WHERE b.status = 'confirmed'
      AND b.start_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
),
property_booking_counts AS (
    -- Step 2: Count bookings per property
    SELECT
        p.id AS property_id,
        p.name AS property_name,
        COUNT(rb.id) AS booking_count
    FROM properties p
    LEFT JOIN recent_bookings rb ON p.id = rb.property_id
    GROUP BY p.id, p.name
),
total_bookings AS (
    -- Step 3: Get total bookings across all properties
    SELECT SUM(booking_count) AS total FROM property_booking_counts
)
-- Final SELECT: Combine counts and percentages, apply ranking
SELECT
    pbc.property_id,
    pbc.property_name,
    pbc.booking_count,
    -- Window function: Rank properties by booking count (ties share the same rank)
    RANK() OVER (ORDER BY pbc.booking_count DESC) AS booking_rank,
    -- Calculate % of total bookings
    ROUND((pbc.booking_count / tb.total) * 100, 2) AS booking_percentage
FROM property_booking_counts pbc, total_bookings tb
ORDER BY booking_rank;

-- Query 3: Assign a unique row number to each booking per user (recent 30 days), ordered by start date
SELECT
    b.id AS booking_id,
    u.id AS user_id,
    u.name AS user_name,
    b.start_date,
    b.end_date,
    -- ROW_NUMBER() gives a unique number to each booking for a user, ordered by start_date
    ROW_NUMBER() OVER (
        PARTITION BY b.user_id
        ORDER BY b.start_date
    ) AS booking_sequence
FROM bookings b
JOIN users u ON b.user_id = u.id
WHERE b.start_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
ORDER BY u.id, booking_sequence;
