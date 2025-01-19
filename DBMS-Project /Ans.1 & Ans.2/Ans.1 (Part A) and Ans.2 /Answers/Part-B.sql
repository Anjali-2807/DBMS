-- Part B: Populate Tables with Mock Data

-- Insert mock data into the Customers table
INSERT INTO Customers (customer_id, name, phone_number, email, address, payment_method, preferences) VALUES (1, 'Anjali Tiwari', '123456XXXX', 'anjali@example.com', 'XYZ Street', 'Credit Card', 'Vegetarian'); 

-- Insert mock data into the Orders table
INSERT INTO Orders (order_id, customer_id, total_amount, order_date, discount_code, delivery_time, delivery_address, email) VALUES (1, 1, 350.00, '2025-01-16 18:30:00', NULL, '2025-01-16 17:45:00', 'XYZ Street', 'anjali@example.com');

-- Insert mock data into the Restaurants table
INSERT INTO Restaurants (restaurant_id, name, phone_number, delivery_time, working_hours, location, rating) VALUES (1, 'Pizza Palace', '987654XXXX', 30, '10:00-22:00', 'ABC Street', 4.5);

-- Insert mock data into the MenuItems table
INSERT INTO MenuItems (menu_item_id, restaurant_id, name, description, price, image_url, is_available) VALUES (1, 1, 'Margherita Pizza', 'Classic cheese pizza', 350.00, 'url_to_image', TRUE);

-- Insert mock data into the Payments table
INSERT INTO Payments (payment_id, order_id, customer_id, payment_gateway, transaction_id, amount, payment_method, payment_status) VALUES (1, 1, 1, 'Paytm', 'TX123456789', 400.00, 'Credit Card', 'Completed');

-- Insert mock data into the DeliveryPersons table
INSERT INTO DeliveryPersons (delivery_person_id, name, phone_number, vehicle_details, current_location) VALUES (1, 'Vikas Kumar', '9998887777', 'Bike - Yamaha', 'City Center');

-- Insert mock data into the Discounts table
INSERT INTO Discounts (discount_code, description, valid_from, valid_until, discount_percentage) VALUES ('NEWYEAR2025', '20% off for New Year', '2025-01-01', '2025-01-31', 20.0);
