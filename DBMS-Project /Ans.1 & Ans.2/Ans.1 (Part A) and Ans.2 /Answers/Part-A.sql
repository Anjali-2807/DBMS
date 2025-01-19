-- Part A: Create Database Tables
-- Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    address TEXT NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    preferences TEXT
);

-- Discounts Table
CREATE TABLE Discounts (
    discount_code VARCHAR(20) PRIMARY KEY,
    description TEXT NOT NULL,
    valid_from DATE NOT NULL,
    valid_until DATE NOT NULL,
    discount_percentage DECIMAL(5, 2) CHECK (discount_percentage BETWEEN 0 AND 100)
);

-- Restaurants Table
CREATE TABLE Restaurants (
    restaurant_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    delivery_time INT NOT NULL, -- in minutes
    working_hours VARCHAR(50) NOT NULL,
    location TEXT NOT NULL,
    rating DECIMAL(2, 1) CHECK (rating BETWEEN 1.0 AND 5.0)
);

-- Menu Items Table
CREATE TABLE MenuItems (
    menu_item_id INT PRIMARY KEY,
    restaurant_id INT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    image_url TEXT,
    is_available BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

-- Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    total_amount DECIMAL(10, 2) NOT NULL,
    delivery_time DATETIME NOT NULL,
    discount_code VARCHAR(20),
    order_date DATETIME NOT NULL,
    delivery_address TEXT NOT NULL,
    email VARCHAR(100) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (discount_code) REFERENCES Discounts(discount_code)
);

-- Payments Table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    customer_id INT,
    payment_gateway VARCHAR(50) NOT NULL,
    transaction_id VARCHAR(50) UNIQUE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    payment_status VARCHAR(20) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Delivery Persons Table
CREATE TABLE DeliveryPersons (
    delivery_person_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    vehicle_details TEXT NOT NULL,
    current_location TEXT NOT NULL
);

