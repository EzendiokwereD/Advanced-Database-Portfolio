-- 1. Add a dummy guest
INSERT INTO Guest (GuestID, FullName, Email, PhoneNumber) 
VALUES (1, 'Chinedu Okafor', 'chinedu.o@email.com', '08012345678');

-- 2. Add some rooms (One available, one booked)
INSERT INTO Room (RoomNumber, RoomType, PricePerNight, IsAvailable) 
VALUES (101, 'Standard', 25000.00, FALSE),
       (102, 'Suite', 75000.00, TRUE);

-- 3. Add a staff member
INSERT INTO Staff (StaffID, FullName, JobRole, Shift) 
VALUES (1, 'Amina Bello', 'Receptionist', 'Morning');

-- 4. Create a booking for Chinedu in Room 101
INSERT INTO Booking (BookingID, GuestID, RoomNumber, StaffID, CheckInDate, CheckOutDate) 
VALUES (1, 1, 101, 1, '2026-11-10', '2026-11-15');

-- 5. Add a room service order for Chinedu's booking
INSERT INTO RoomService (OrderID, BookingID, StaffID, ItemName, TotalCost)
VALUES (1, 1, 1, 'Jollof Rice and Chicken', 5000.00);

-- 6. Add Chinedu's payment
INSERT INTO Payment (PaymentID, BookingID, AmountPaid, PaymentMethod)
VALUES (1, 1, 130000.00, 'Card');