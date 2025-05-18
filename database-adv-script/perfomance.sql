-- Fetch full booking details: user, property, and payment
-- Unoptimized version: includes unnecessary joins and no filtering
SELECT
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.id AS user_id,
    u.name AS user_name,
    u.email,
    p.id AS property_id,
    p.name AS property_name,
    p.price_per_night,
    pay.amount,
    pay.payment_date,
    pay.status AS payment_status
FROM bookings b
-- Join with users
LEFT JOIN users u ON b.user_id = u.id
-- Join with properties
LEFT JOIN properties p ON b.property_id = p.id
-- Join with payments (optional relationship)
LEFT JOIN payments pay ON b.id = pay.booking_id
ORDER BY b.start_date DESC;


-- Optimized version: Fetch recent 6 months' confirmed bookings with necessary details
SELECT
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.name AS user_name,
    p.name AS property_name,
    p.price_per_night,
    pay.amount,
    pay.status AS payment_status
FROM bookings b
-- INNER JOIN ensures only valid relationships
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id
-- Only include confirmed bookings from the last 6 months
WHERE b.status = 'confirmed'
  AND b.start_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
ORDER BY b.start_date DESC
LIMIT 100;
