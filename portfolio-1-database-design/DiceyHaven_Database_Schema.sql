-- 1. Create the Guest Table
CREATE TABLE Guest (
    GuestID INT PRIMARY KEY,               -- The unique ID for the guest
    FullName VARCHAR(100) NOT NULL,        -- 'VARCHAR' just means text. NOT NULL means it cannot be empty.
    Email VARCHAR(100) UNIQUE,             -- UNIQUE means no two guests can have the same email
    PhoneNumber VARCHAR(15)
);

-- 2. Create the Room Table
CREATE TABLE Room (
    RoomNumber INT PRIMARY KEY,            -- The unique room number (e.g., 101, 102)
    RoomType VARCHAR(50) NOT NULL,         -- e.g., 'Standard', 'Suite'
    PricePerNight DECIMAL(10, 2) NOT NULL, -- DECIMAL allows for money values (e.g., 50000.00)
    IsAvailable BOOLEAN DEFAULT TRUE       -- BOOLEAN means True/False. It defaults to True (available).
);

-- 3. Create the Staff Table
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    JobRole VARCHAR(50) NOT NULL,          -- e.g., 'Receptionist', 'Room Service'
    Shift VARCHAR(20)                      -- e.g., 'Morning', 'Night'
);

-- 4. Create the Booking Table
CREATE TABLE Booking (
    BookingID INT PRIMARY KEY,
    GuestID INT,                           -- This is the Foreign Key linking to the Guest
    RoomNumber INT,                        -- This is the Foreign Key linking to the Room
    StaffID INT,                           -- This is the Foreign Key linking to the Staff who booked it
    CheckInDate DATE NOT NULL,             -- DATE format (e.g., 2026-11-10)
    CheckOutDate DATE NOT NULL,
    FOREIGN KEY (GuestID) REFERENCES Guest(GuestID),
    FOREIGN KEY (RoomNumber) REFERENCES Room(RoomNumber),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- 5. Create the Room Service Table
CREATE TABLE RoomService (
    OrderID INT PRIMARY KEY,
    BookingID INT,                         -- Links the order to a specific booking
    StaffID INT,                           -- Links to the staff who delivered it
    ItemName VARCHAR(100) NOT NULL,
    TotalCost DECIMAL(10, 2) NOT NULL,
    OrderTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Automatically saves the exact date and time of the order
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- 6. Create the Payment Table
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    BookingID INT,                         -- Links the payment to the booking
    AmountPaid DECIMAL(10, 2) NOT NULL,
    PaymentMethod VARCHAR(50),             -- e.g., 'Card', 'Transfer'
    PaymentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
);