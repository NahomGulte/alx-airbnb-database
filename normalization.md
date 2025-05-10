# Airbnb Clone Backend Database Normalization to 3NF

## Objective
Ensure the Airbnb clone backend schema adheres to the Third Normal Form (3NF) to eliminate redundancy and ensure data integrity.

---

## 🔁 Normalization Steps

### 🔹 Step 1: First Normal Form (1NF)
**Requirements:**
- Atomic values (no repeating groups or arrays).
- Each field contains only a single value.

✅ **Applied To:**
- All tables have atomic attributes.
- E.g., `User.email`, `Property.title`, `Booking.start_date` are singular and indivisible.

---

### 🔸 Step 2: Second Normal Form (2NF)
**Requirements:**
- Must be in 1NF.
- All non-key attributes must depend on the whole primary key (no partial dependency).

✅ **Applied To:**
- All tables have single-column primary keys.
- No partial dependencies exist.

---

### 🔺 Step 3: Third Normal Form (3NF)
**Requirements:**
- Must be in 2NF.
- No transitive dependencies (i.e., non-key attributes should not depend on other non-key attributes).

---

## 💾 3NF Assessment and Adjustments

### 1. **User Table**
**Current:**
- id, name, email, password_hash, user_type, email_verified, created_at

✅ No redundancy.
✅ All fields are dependent only on the primary key `id`.

---

### 2. **Property Table**
**Current:**
- id, host_id (FK), title, description, location, price_per_night, max_guests

✅ No transitive dependencies.
✅ `host_id` is a foreign key to `User`.

---

### 3. **Booking Table**
**Current:**
- id, guest_id (FK), property_id (FK), start_date, end_date, total_price, status, payment_status

✅ `guest_id` and `property_id` are FKs.
✅ `total_price` is derived but stored for performance — acceptable in 3NF if computed at transaction time.

---

### 4. **Payment Table**
**Current:**
- id, booking_id (FK), user_id (FK), amount, currency, status, transaction_id, response_code

⚠️ **Issue Detected:**
- `user_id` could be redundant since `booking_id` already relates to a user via `Booking.guest_id`.

**Adjustment:**
- Remove `user_id` from `Payment` to prevent transitive dependency:
  ```diff
  - user_id
