-- 1. Create the Trip table (no foreign key dependencies)
CREATE TABLE Trip (
    trip_id INT AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(50) NOT NULL,
    expected_arrival_time DATETIME NOT NULL,
    actual_arrival_time DATETIME
);

-- 2. Create the Route table (no foreign key dependencies)
CREATE TABLE Route (
    route_id INT AUTO_INCREMENT PRIMARY KEY,
    departure_city VARCHAR(100) NOT NULL,
    destination_city VARCHAR(100) NOT NULL,
    departure_time DATETIME NOT NULL,
    arrival_time DATETIME NOT NULL
);

-- 3. Create the Bus table (no foreign key dependencies)
CREATE TABLE Bus (
    bus_id INT AUTO_INCREMENT PRIMARY KEY,
    bus_type VARCHAR(50) NOT NULL,
    operator_name VARCHAR(100) NOT NULL,
    bus_name VARCHAR(100) NOT NULL
);

-- 4. Create the Passenger table (referenced by Ticket, Review, and PhoneNumbers)
CREATE TABLE Passenger (
    passenger_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL
);

-- 5. Create the Ticket table (depends on Passenger and Trip)
CREATE TABLE Ticket (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    passenger_id INT NOT NULL,
    status VARCHAR(50) NOT NULL,
    booking_date DATE NOT NULL,
    seat_number VARCHAR(10) NOT NULL,
    trip_id INT,
    FOREIGN KEY (passenger_id) REFERENCES Passenger(passenger_id),
    FOREIGN KEY (trip_id) REFERENCES Trip(trip_id)
);

-- 6. Create the Review table (depends on Passenger)
CREATE TABLE Review (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    passenger_id INT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comments TEXT,
    FOREIGN KEY (passenger_id) REFERENCES Passenger(passenger_id)
);

-- 7. Create the CheckIn table (depends on Ticket)
CREATE TABLE CheckIn (
    check_in_id INT AUTO_INCREMENT PRIMARY KEY,
    ticket_id INT NOT NULL UNIQUE,
    check_in_time DATETIME NOT NULL,
    status VARCHAR(50) NOT NULL,
    boarding_date DATE NOT NULL,
    FOREIGN KEY (ticket_id) REFERENCES Ticket(ticket_id)
);

-- 8. Create the PhoneNumbers table (depends on Passenger)
CREATE TABLE PhoneNumbers (
    phone_id INT AUTO_INCREMENT PRIMARY KEY,
    passenger_id INT NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    FOREIGN KEY (passenger_id) REFERENCES Passenger(passenger_id)
);
