-- CREATED DATABASE

create database D_International;
use d_international;

-- CREATED TABLES
CREATE TABLE Guests (
    guest_id        INT PRIMARY KEY AUTO_INCREMENT,
    first_name      VARCHAR(50)  NOT NULL,
    last_name       VARCHAR(50)  NOT NULL,
    email           VARCHAR(100) NOT NULL UNIQUE,
    phone           VARCHAR(15)  NOT NULL UNIQUE,
    city            VARCHAR(50),
    id_proof_type   VARCHAR(20)  NOT NULL,
    id_proof_number VARCHAR(30)  NOT NULL UNIQUE
);

CREATE TABLE RoomTypes (
    type_id         INT PRIMARY KEY AUTO_INCREMENT,
    type_name       VARCHAR(50)   NOT NULL UNIQUE,
    price_per_night DECIMAL(10,2) NOT NULL,
    max_capacity    INT           NOT NULL,
    description     VARCHAR(200)
);

CREATE TABLE Rooms (
    room_id     INT PRIMARY KEY AUTO_INCREMENT,
    room_number VARCHAR(10) NOT NULL UNIQUE,
    type_id     INT         NOT NULL,
    floor_no    INT         NOT NULL,
    status      VARCHAR(20) DEFAULT 'Available',
    FOREIGN KEY (type_id) REFERENCES RoomTypes(type_id)
);

CREATE TABLE Reservations (
    reservation_id INT PRIMARY KEY AUTO_INCREMENT,
    guest_id       INT         NOT NULL,
    room_id        INT         NOT NULL,
    check_in_date  DATE        NOT NULL,
    check_out_date DATE        NOT NULL,
    num_guests     INT         NOT NULL,
    status         VARCHAR(20) DEFAULT 'Booked',
    FOREIGN KEY (guest_id) REFERENCES Guests(guest_id),
    FOREIGN KEY (room_id)  REFERENCES Rooms(room_id)
);

CREATE TABLE Payments (
    payment_id     INT PRIMARY KEY AUTO_INCREMENT,
    reservation_id INT           NOT NULL,
    amount         DECIMAL(10,2) NOT NULL,
    payment_date   DATE          NOT NULL,
    method         VARCHAR(20)   NOT NULL,
    status         VARCHAR(20)   DEFAULT 'Pending',
    FOREIGN KEY (reservation_id) REFERENCES Reservations(reservation_id)
);

CREATE TABLE Services (
    service_id   INT PRIMARY KEY AUTO_INCREMENT,
    service_name VARCHAR(60)  NOT NULL UNIQUE,
    category     VARCHAR(30)  NOT NULL,
    price        DECIMAL(8,2) NOT NULL
);

-- adding data's into tables

INSERT INTO Guests (first_name, last_name, email, phone, city, id_proof_type, id_proof_number) VALUES
('Arun',   'Nair',   'arun.nair@example.com',     '9847012345', 'Thiruvananthapuram', 'Aadhaar',         '4521-8890-1234'),
('Priya',  'Menon',  'priya.menon@example.com',   '9895123456', 'Kochi',			  'Passport',        'M1234567'),
('Rahul',  'Sharma', 'rahul.sharma@example.com',  '9811234567', 'Delhi',              'Driving License', 'DL-0420110012345'),
('Sneha',  'Iyer',   'sneha.iyer@example.com',    '9944556677', 'Chennai',            'Voter ID',        'KLX1234567'),
('John',   'Thomas', 'john.thomas@example.com',   '9446778899', 'Kottayam',           'Passport',        'N7654321'),
('Fatima', 'Rahman', 'fatima.rahman@example.com', '9633221100', 'Kozhikode',          'Aadhaar',         '7788-1122-3344'),
('Vikram', 'Singh',  'vikram.singh@example.com',  '9822334455', 'Mumbai',             'Passport',        'P2345678'),
('Anjali', 'Pillai', 'anjali.pillai@example.com', '9745098765', 'Thrissur',           'Aadhaar',         '3344-5566-7788'),
('David',  'Fernandez','david.fernandez@example.com','9886543210','Bengaluru',        'Driving License', 'KA-0120190054321'),
('Meera',  'Krishnan','meera.krishnan@example.com','9487612345', 'Coimbatore',        'Voter ID',        'TNX7654321');

INSERT INTO RoomTypes (type_name, price_per_night, max_capacity, description) VALUES
('Deluxe Room',         8000.00,  2, 'King bed, marble bathroom, city view'),
('Executive Room',     11000.00,  2, 'Club-floor room with executive lounge access'),
('Club Suite',         18000.00,  3, 'Separate living area, ocean view'),
('Royal Family Suite', 25000.00,  5, 'Two bedrooms, dining area, private balcony'),
('Presidential Suite', 55000.00,  4, 'Penthouse with private pool and personal butler');

INSERT INTO Rooms (room_number, type_id, floor_no, status) VALUES
('101', 1, 1, 'Available'),
('102', 1, 1, 'Available'),
('201', 2, 2, 'Maintenance'),
('202', 2, 2, 'Available'),
('301', 3, 3, 'Occupied'),
('302', 3, 3, 'Available'),
('401', 4, 4, 'Available'),
('501', 5, 5, 'Available'),
('103', 1, 1, 'Available'),
('104', 1, 1, 'Occupied'),
('105', 1, 1, 'Available'),
('203', 2, 2, 'Available'),
('204', 2, 2, 'Occupied'),
('303', 3, 3, 'Available'),
('304', 3, 3, 'Maintenance'),
('402', 4, 4, 'Available'),
('403', 4, 4, 'Available'),
('502', 5, 5, 'Available');

INSERT INTO Reservations (guest_id, room_id, check_in_date, check_out_date, num_guests, status) VALUES
(1, 2, '2026-11-10', '2026-11-13', 2, 'Checked-Out'),
(2, 4, '2026-11-15', '2026-11-18', 2, 'Checked-Out'),
(3, 5, '2026-11-20', '2026-11-24', 2, 'Checked-In'),
(4, 7, '2026-11-25', '2026-11-28', 5, 'Booked'),
(5, 1, '2026-11-12', '2026-11-14', 1, 'Checked-Out'),
(6, 8, '2026-12-01', '2026-12-05', 2, 'Booked'),
(1, 6, '2026-12-10', '2026-12-12', 2, 'Cancelled');

INSERT INTO Payments (reservation_id, amount, payment_date, method, status) VALUES
(1, 24000.00, '2026-11-13', 'UPI',         'Paid'),
(2, 33000.00, '2026-11-18', 'Credit Card', 'Paid'),
(3, 40000.00, '2026-11-20', 'Credit Card', 'Paid'),
(4, 25000.00, '2026-11-20', 'Net Banking', 'Paid'),
(5, 16000.00, '2026-11-14', 'Debit Card',  'Paid'),
(6, 55000.00, '2026-11-22', 'Net Banking', 'Paid'),
(7,  9000.00, '2026-12-01', 'Credit Card', 'Refunded'),
(3, 32000.00, '2026-11-21', 'UPI',         'Pending');

INSERT INTO Services (service_name, category, price) VALUES
('Complimentary Breakfast',   'Food',             0.00),
('Dinner Buffet',             'Food',          2800.00),
('A La Carte Dining',         'Food',          3500.00),
('Spa Massage',               'Wellness',      6500.00),
('Airport Limousine Transfer','Transport',     4500.00),
('Laundry and Pressing',      'Housekeeping',   800.00),
('Personal Butler Service',   'Concierge',     5000.00),
('In-Room Dining',            'Food',          3200.00);

select * from guests;
sELECT reservation_id, SUM(amount) AS total_paid
FROM Payments
GROUP BY reservation_id;
