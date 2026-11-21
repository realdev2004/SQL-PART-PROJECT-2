# Project Title

**d_international – Hotel Management Database**

## Selected Scenario

**Hotel Management** – a 5-star hotel named *d_international*.

## Project Description

This database manages the day-to-day data of a 5-star hotel. It keeps track of:

- the guests who stay at the hotel and their ID details
- the types of rooms (Deluxe, Executive, Club Suite, Royal Family Suite, Presidential Suite) with their price and capacity
- the individual rooms and whether each is available, occupied or under maintenance
- guest reservations with check-in and check-out dates
- payments made against each reservation
- the services offered by the hotel, such as complimentary breakfast, dinner buffet, à la carte dining and spa

## Tables Created

| # | Table | Purpose | Columns |
|---|---|---|---|
| 1 | **Guests** | Guest details | guest_id (PK), first_name, last_name, email (UNIQUE), phone (UNIQUE), city, id_proof_type, id_proof_number (UNIQUE) |
| 2 | **RoomTypes** | Room categories with price and capacity | type_id (PK), type_name (UNIQUE), price_per_night, max_capacity, description |
| 3 | **Rooms** | Individual hotel rooms | room_id (PK), room_number (UNIQUE), type_id (FK), floor_no, status |
| 4 | **Reservations** | Room bookings by guests | reservation_id (PK), guest_id (FK), room_id (FK), check_in_date, check_out_date, num_guests, status |
| 5 | **Payments** | Payments for reservations | payment_id (PK), reservation_id (FK), amount, payment_date, method, status |
| 6 | **Services** | Catalogue of hotel services and extras | service_id (PK), service_name (UNIQUE), category, price |

## Relationships

| Relationship | Type | Foreign Key |
|---|---|---|
| Guests → Reservations | One-to-many (one guest can make many reservations) | Reservations.guest_id |
| RoomTypes → Rooms | One-to-many (one room type has many rooms) | Rooms.type_id |
| Rooms → Reservations | One-to-many (one room can be booked many times) | Reservations.room_id |
| Reservations → Payments | One-to-many (one reservation can have many payments) | Payments.reservation_id |

`Services` is a standalone catalogue of hotel services and is not linked to another table.

## Constraints and Data Types

- **Constraints:** `PRIMARY KEY`, `AUTO_INCREMENT`, `FOREIGN KEY`, `NOT NULL`, `UNIQUE`, `DEFAULT`
- **Data types:** `INT`, `VARCHAR`, `DECIMAL`, `DATE`

## Sample Data

| Table | Records |
|---|---|
| Guests | 10 |
| RoomTypes | 5 |
| Rooms | 18 |
| Reservations | 7 |
| Payments | 8 |
| Services | 8 |

Prices are in Indian Rupees (INR).

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

## Generating the ER Diagram

1. In MySQL Workbench, go to **Database → Reverse Engineer**.
2. Select your connection and choose the `d_international` schema.
3. Continue to the end, keeping **Place imported objects on a diagram** ticked.
4. Arrange the tables, then export with **File → Export → Export as PNG** (or PDF).
