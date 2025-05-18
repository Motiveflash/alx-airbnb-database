-- Query 1: Get detailed info about each booking including the user who made it and the property booked
SELECT
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    b.created_at AS booking_created_at,
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email,
    p.id AS property_id,
    p.name AS property_name,
    p.location AS property_location
FROM bookings b
-- Join users table to get the person who made the booking
INNER JOIN users u ON b.user_id = u.id
-- Join properties table to get the property booked
INNER JOIN properties p ON b.property_id = p.id
WHERE b.start_date >= CURRENT_DATE
-- Show only future bookings
ORDER BY b.start_date ASC;


-- Query 2: INNER JOIN – LEFT JOIN – Show all properties and their reviews (if any), including reviewer info
SELECT
    p.id AS property_id,
    p.name AS property_name,
    p.location,
    r.id AS review_id,
    r.rating,
    r.comment,
    r.created_at AS review_date,
    u.id AS reviewer_id,
    u.name AS reviewer_name
FROM properties p
-- Get all reviews for each property (if any)
LEFT JOIN reviews r ON p.id = r.property_id
-- Join users to get info about the person who left the review
LEFT JOIN users u ON r.user_id = u.id
ORDER BY p.id, r.created_at DESC;


-- Query 3: Show all users and all bookings, even if a booking is not linked to a user or a user has no bookings
-- Part 1: All users with their bookings (if any)
SELECT
    u.id AS user_id,
    u.name AS user_name,
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    b.property_id
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id

UNION

-- Part 2: FULL OUTER JOIN (simulated) – All bookings with their users (if any)
SELECT
    u.id AS user_id,
    u.name AS user_name,
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    b.property_id
FROM bookings b
LEFT JOIN users u ON b.user_id = u.id
WHERE u.id IS NULL;
-- Ensures we don't duplicate rows already included above

-- NOTE: FULL OUTER JOIN is simulated using two LEFT JOINs and UNION
