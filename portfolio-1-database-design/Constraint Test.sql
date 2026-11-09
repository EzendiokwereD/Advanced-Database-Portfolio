-- Test 1: "Show me all rooms that are currently available to be booked."
SELECT RoomNumber, RoomType, PricePerNight 
FROM Room 
WHERE IsAvailable = TRUE;
-- Expected Result: It should only show Room 102.

-- Test 2: "Show me the total bill (room service + room price) for Booking ID 1."
-- This is a 'JOIN', meaning we are asking the database to connect the Booking, Room, and RoomService tables together to give us one answer.
SELECT 
    Guest.FullName, 
    Room.RoomNumber, 
    Payment.AmountPaid,
    RoomService.ItemName
FROM Booking
JOIN Guest ON Booking.GuestID = Guest.GuestID
JOIN Room ON Booking.RoomNumber = Room.RoomNumber
JOIN Payment ON Booking.BookingID = Payment.BookingID
JOIN RoomService ON Booking.BookingID = RoomService.BookingID
WHERE Booking.BookingID = 1;