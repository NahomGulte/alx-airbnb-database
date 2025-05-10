🧍 1. User

Attributes:

    id (PK)

    name

    email

    password_hash

    user_type (enum: guest, host)

    email_verified (boolean)

    created_at

    updated_at

🏠 2. listing

Attributes:

    id (PK)

    title

    description

    location

    price_per_night

    max_guests

    images (could be stored in a separate property_images table)

    amenities (could be normalized in a join table)

    created_at

    updated_at

📅 3. Booking

Attributes:

    id (PK)

    customer_id (FK → User.id)

    listing_id (FK → Property.id)

    start_date

    end_date

    total_price

    status (enum: pending, confirmed, cancelled)

    payment_status (enum: unpaid, paid, refunded)

    created_at

💳 4. Payment

Attributes:

    id (PK)

    booking_id (FK → Booking.id)

    customer_id (FK → User.id)

    amount

    currency

    status (enum: pending, completed, failed, refunded)

    transaction_ref

    payment_status

    created_at
