# 🏠 Property Booking Platform – Database Schema

This project defines a **relational database schema** for a property booking platform, similar to Airbnb. The schema supports core functionality such as user management, property listings, bookings, payments, messaging, and reviews.

---

## 📦 Contents

- [`ERD.md`](./ERD.md): Entity-Relationship Diagram explanation
- [`Normalization.md`](./Normalization.md): Normalization steps up to 3NF
- [`schema.sql`](./schema.sql): SQL script to create all tables and constraints
- This `README.md`: Project overview

---

## 🧠 Features Covered in Schema

### 👤 User
- Roles: `guest`, `host`, `admin`
- Attributes: Name, email, password hash, phone, created timestamp

### 🏡 Property
- Linked to a `host` (User)
- Includes name, description, location, price

### 📅 Booking
- Created by `guest` users for a specific `property`
- Includes date range, total price, and status

### 💳 Payment
- Tied to a booking
- Supports multiple methods: `credit_card`, `paypal`, `stripe`

### ⭐ Review
- Written by a user for a property after a stay
- Includes rating and comment

### 💬 Message
- Direct messaging between users (host ↔ guest)

---

## ⚙️ Technologies

- **PostgreSQL** (Recommended)
- SQL data types: `UUID`, `VARCHAR`, `DECIMAL`, `ENUM` via `CHECK`, `TIMESTAMP`
- Indexes for fast query performance

---
