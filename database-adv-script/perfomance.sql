-- 🔴 Unoptimized version: includes unnecessary LEFT JOINs and no filtering
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
LEFT JOIN users u ON b.user_id = u.id
LEFT JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id
ORDER BY b.start_date DESC;

-- 🧪 EXPLAIN for unoptimized version
EXPLAIN
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
LEFT JOIN users u ON b.user_id = u.id
LEFT JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id
ORDER BY b.start_date DESC;

-- ✅ Optimized version: Fetch recent 6 months' confirmed bookings
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
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id
WHERE b.status = 'confirmed'
  AND b.start_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
ORDER BY b.start_date DESC
LIMIT 100;

-- 🧪 EXPLAIN for optimized version
EXPLAIN
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
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id
WHERE b.status = 'confirmed'
  AND b.start_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
ORDER BY b.start_date DESC
LIMIT 100;