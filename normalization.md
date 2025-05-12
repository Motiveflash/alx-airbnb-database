# 📚 Database Normalization to 3NF

## 🎯 Objective
Ensure the property booking platform schema adheres to the **Third Normal Form (3NF)** by eliminating redundancy and ensuring data integrity through proper normalization steps.

---

## 🧱 Normal Forms Overview

### 🔹 First Normal Form (1NF)
- **Rule**: All attributes must have atomic (indivisible) values.
- **Status**: ✅ All fields in the schema are atomic (no repeating groups or arrays).

### 🔹 Second Normal Form (2NF)
- **Rule**: Must be in 1NF and all non-key attributes must be fully dependent on the **entire primary key** (only relevant for composite keys).
- **Status**: ✅ All tables use **single-column primary keys** (UUIDs), so there are no partial dependencies.

### 🔹 Third Normal Form (3NF)
- **Rule**: Must be in 2NF and **no transitive dependency** (non-key attribute should not depend on another non-key attribute).
- **Status**: 🔍 Reviewed and explained below.

---

## 🧪 Normalization Analysis

### ✅ User Table
- No redundant data.
- All non-key attributes depend on the primary key `user_id`.
- `role` is an ENUM and not derived from another attribute.
- **3NF: Compliant**

---

### ✅ Property Table
- `host_id` is a foreign key; no derived data like host names are stored here.
- No repeating or grouped attributes.
- **3NF: Compliant**

---

### ✅ Booking Table
- `total_price` may appear derived (e.g., `pricepernight × nights`) but storing it is acceptable for historical accuracy and performance.
- If calculated dynamically in the app, could be omitted to reduce redundancy.
- However, since pricing can change over time, **keeping `total_price` is justified**.
- **3NF: Compliant**

---

### ✅ Payment Table
- `amount` is linked to `booking_id`, and `payment_method` is atomic.
- No transitive dependency.
- **3NF: Compliant**

---

### ✅ Review Table
- Only includes direct relationships and scalar fields.
- `rating` and `comment` depend only on the combination of `user_id` and `property_id`.
- If needed, a composite UNIQUE constraint can enforce one review per user per property.
- **3NF: Compliant**

---

### ✅ Message Table
- Sender and recipient are both foreign keys to `User`.
- No additional user information stored here.
- **3NF: Compliant**

---

## ✅ Summary

| Table     | 1NF | 2NF | 3NF | Comments |
|-----------|-----|-----|-----|----------|
| User      | ✅  | ✅  | ✅  | No issues |
| Property  | ✅  | ✅  | ✅  | Clean relationships |
| Booking   | ✅  | ✅  | ✅  | `total_price` stored for historical integrity |
| Payment   | ✅  | ✅  | ✅  | Fully normalized |
| Review    | ✅  | ✅  | ✅  | Optionally enforce unique review per user-property |
| Message   | ✅  | ✅  | ✅  | No transitive dependencies |

---

## 🛠 Recommendations (Optional Enhancements)
- **Add a lookup table for payment methods** if new types are added often (normalize ENUM).
- Consider extracting `location` from `Property` into a separate `Location` table if it's structured (e.g., city, country).

---
