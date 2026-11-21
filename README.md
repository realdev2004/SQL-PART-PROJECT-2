# d_international – Hotel Management Database

A MySQL database for **d_international**, a 5-star hotel. It stores guests, rooms, room types, reservations, payments and hotel services.

## Files

| File | Description |
|---|---|
| `d_international.sql` | Complete script: creates the database, tables, sample data and sample queries |
| `README.md` | This document |

## How to Run

1. Open **MySQL Workbench** and connect to your server.
2. Go to **File → Open SQL Script** and select `d_international.sql`.
3. Click the lightning bolt (**Execute**) to run the whole script.
4. Refresh the schema panel to see the `d_international` database.

Requires MySQL 5.7 or later.

## Database Design

### Tables and Columns

**Guests**: guest_id (PK), first_name, last_name, email (UNIQUE), phone (UNIQUE), city, id_proof_type, id_proof_number (UNIQUE)

**RoomTypes**: type_id (PK), type_name (UNIQUE), price_per_night, max_capacity, description

**Rooms**: room_id (PK), room_number (UNIQUE), type_id (FK), floor_no, status (default 'Available')

**Reservations**: reservation_id (PK), guest_id (FK), room_id (FK), check_in_date, check_out_date, num_guests, status (default 'Booked')

**Payments**: payment_id (PK), reservation_id (FK), amount, payment_date, method, status (default 'Pending')

**Services**: service_id (PK), service_name (UNIQUE), category, price

### Relationships

| Relationship | Type | Foreign Key |
|---|---|---|
| Guests → Reservations | One-to-many | Reservations.guest_id |
| RoomTypes → Rooms | One-to-many | Rooms.type_id |
| Rooms → Reservations | One-to-many | Reservations.room_id |
| Reservations → Payments | One-to-many | Payments.reservation_id |

`Services` is a standalone catalogue of hotel services and is not linked to another table.

### Constraints Used

- `PRIMARY KEY` and `AUTO_INCREMENT` on every table's ID column
- `FOREIGN KEY` to connect related tables
- `NOT NULL` on required columns
- `UNIQUE` on email, phone, ID proof number, room number, room type name and service name
- `DEFAULT` on the status columns

### Data Types Used

`INT`, `VARCHAR`, `DECIMAL`, `DATE`

## Sample Data

| Table | Records |
|---|---|
| Guests | 10 |
| RoomTypes | 5 (Deluxe, Executive, Club Suite, Royal Family Suite, Presidential Suite) |
| Rooms | 18 |
| Reservations | 7 |
| Payments | 8 |
| Services | 8 (Complimentary Breakfast, Dinner Buffet, A La Carte Dining, Spa Massage, Airport Limousine Transfer, Laundry and Pressing, Personal Butler Service, In-Room Dining) |

Prices are in Indian Rupees (INR).

## Sample Queries

The end of the script includes two queries:

1. Reservations with guest name, room number, dates and status (joins `Reservations`, `Guests` and `Rooms`).
2. Total payments for each reservation (groups `Payments` by `reservation_id`).

## Generating the ER Diagram

1. In MySQL Workbench, go to **Database → Reverse Engineer**.
2. Select your connection and choose the `d_international` schema.
3. Continue to the end, keeping **Place imported objects on a diagram** ticked.
4. Arrange the tables, then export with **File → Export → Export as PNG** (or PDF).
