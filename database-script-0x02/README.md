# 🏠 Property Booking Platform – Database Schema and Sample Data

This repository provides the database schema and sample data for a **Property Booking Platform**. It includes SQL scripts for creating tables, populating the database with sample data, and testing queries.

---

## 📦 Contents

- **`schema.sql`**: SQL script to create the database schema (tables, constraints, etc.)
- **`sample_data.sql`**: SQL script to populate the database with realistic sample data
- **`ERD.md`**: Entity-Relationship Diagram (ERD) explanation
- **`Normalization.md`**: Steps to normalize the database up to Third Normal Form (3NF)
- **This `README.md`**: Project overview, usage, and instructions

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