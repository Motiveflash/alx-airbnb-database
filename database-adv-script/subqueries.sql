-- Query 1: Non-Correlated Subquery

-- Select properties that have more than 5 reviews AND an average rating greater than 4.0
SELECT
    p.id AS property_id,
    p.name AS property_name,
    p.location,
    -- Get average rating using subquery
    (
        SELECT ROUND(AVG(r.rating), 2)
        FROM reviews r
        WHERE r.property_id = p.id
    ) AS average_rating,
    -- Get total review count using subquery
    (
        SELECT COUNT(*)
        FROM reviews r
        WHERE r.property_id = p.id
    ) AS total_reviews
FROM properties p
-- Apply conditions using subqueries in WHERE clause
WHERE
    (
        SELECT AVG(r.rating)
        FROM reviews r
        WHERE r.property_id = p.id
    ) > 4.0
    AND (
        SELECT COUNT(*)
        FROM reviews r
        WHERE r.property_id = p.id
    ) > 5
ORDER BY average_rating DESC;


-- Query 2: Correlated Subquery

--Find users with more than 3 bookings and include the start date of their most recent booking
SELECT
    u.id AS user_id,
    u.name AS user_name,
    u.email,
    -- Get the most recent booking date using a correlated subquery
    (
        SELECT MAX(b.start_date)
        FROM bookings b
        WHERE b.user_id = u.id
    ) AS latest_booking_date
FROM users u
-- Use correlated subquery in WHERE clause to filter users with more than 3 bookings
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.id
) > 3
ORDER BY latest_booking_date DESC;
