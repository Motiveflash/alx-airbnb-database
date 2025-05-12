-- ========================================
-- SAMPLE DATA FOR PROPERTY BOOKING PLATFORM
-- ========================================

-- USERS
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  ('00000000-0000-0000-0000-000000000001', 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw_1', '1234567890', 'guest'),
  ('00000000-0000-0000-0000-000000000002', 'Bob', 'Smith', 'bob@example.com', 'hashed_pw_2', '0987654321', 'host'),
  ('00000000-0000-0000-0000-000000000003', 'Carla', 'Brown', 'carla@example.com', 'hashed_pw_3', '1122334455', 'guest'),
  ('00000000-0000-0000-0000-000000000004', 'David', 'Lee', 'david@example.com', 'hashed_pw_4', '2233445566', 'admin');

-- PROPERTIES
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES
  ('11111111-1111-1111-1111-111111111111', '00000000-0000-0000-0000-000000000002', 'Seaside Villa', 'A cozy villa by the sea', 'Cape Town, South Africa', 150.00),
  ('11111111-1111-1111-1111-111111111112', '00000000-0000-0000-0000-000000000002', 'Urban Loft', 'Modern loft in the city center', 'Accra, Ghana', 95.00);

-- BOOKINGS
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  ('22222222-2222-2222-2222-222222222221', '11111111-1111-1111-1111-111111111111', '00000000-0000-0000-0000-000000000001', '2025-07-01', '2025-07-05', 600.00, 'confirmed'),
  ('22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111112', '00000000-0000-0000-0000-000000000003', '2025-07-10', '2025-07-12', 190.00, 'pending');

-- PAYMENTS
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
  ('33333333-3333-3333-3333-333333333331', '22222222-2222-2222-2222-222222222221', 600.00, 'credit_card');

-- REVIEWS
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
  ('44444444-4444-4444-4444-444444444441', '11111111-1111-1111-1111-111111111111', '00000000-0000-0000-0000-000000000001', 5, 'Fantastic location and very clean!');

-- MESSAGES
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
  ('55555555-5555-5555-5555-555555555551', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000002', 'Hi Bob, I have a question about the villa.'),
  ('55555555-5555-5555-5555-555555555552', '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000001', 'Sure, feel free to ask anything!');
