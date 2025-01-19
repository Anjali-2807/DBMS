-- 1. Insert a record into the Trip table
INSERT INTO Trip (status, expected_arrival_time, actual_arrival_time) VALUES ('Scheduled', '2025-01-20 08:00:00', '2025-01-20 08:30:00');

-- 2. Insert a record into the Route table
INSERT INTO Route (departure_city, destination_city, departure_time, arrival_time) VALUES ('City1', 'City2', '2025-01-20 06:00:00', '2025-01-20 08:00:00');

-- 3. Insert a record into the Bus table
INSERT INTO Bus (bus_type, operator_name, bus_name) VALUES ('Double Decker', 'ABC Transport', 'City Express');

-- 4. Insert a record into the Passenger table
INSERT INTO Passenger (email, name) VALUES ('anjali@example.com', 'Anjali Tiwari');

-- 5. Insert a record into the Ticket table (using the trip_id from Trip)
INSERT INTO Ticket (passenger_id, status, booking_date, seat_number, trip_id) VALUES (1, 'Booked', '2025-01-16', 'A1', 1);

-- 6. Insert a record into the Review table (using the passenger_id from Passenger)
INSERT INTO Review (passenger_id, rating, comments) VALUES (1, 5, 'Excellent journey, very comfortable.');

-- 7. Insert a record into the CheckIn table (using the ticket_id from Ticket)
INSERT INTO CheckIn (ticket_id, check_in_time, status, boarding_date) VALUES (1, '2025-01-20 07:00:00', 'Checked-In', '2025-01-20');

-- 8. Insert a record into the PhoneNumbers table (using the passenger_id from Passenger)
INSERT INTO PhoneNumbers (passenger_id, phone_number) VALUES (1, '123-456-7890');
