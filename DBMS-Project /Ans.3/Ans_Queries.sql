-- 1. Retrieve all available flights from the source airport to the destination airport
SELECT f.*
FROM flight f
JOIN airport src ON f.from = src.airport_id
JOIN airport dest ON f.to = dest.airport_id
WHERE src.name = 'BORG EL ARAB INTL'
  AND dest.name = 'LABUAN';

-- 2. Calculate the average price of booking per seat for a given flight ID
SELECT b.flight_id, AVG(b.price) AS average_price_per_seat
FROM booking b
WHERE b.flight_id = 3863
GROUP BY b.flight_id;

-- 3. Retrieve all the different airline types a passenger has traveled in
SELECT DISTINCT at.identifier
FROM passengerdetails pd
JOIN booking b ON pd.passenger_id = b.passenger_id
JOIN flight f ON b.flight_id = f.flight_id
JOIN airplane a ON f.airplane_id = a.airplane_id
JOIN airplane_type at ON a.type_id = at.type_id
WHERE pd.passenger_id = 16678;

-- 4. Count the number of unsuitable weather dates and list the dates
-- Part 1: Count the number of unsuitable weather dates
SELECT COUNT(DISTINCT log_date) AS unsuitable_weather_dates
FROM weatherdata
WHERE airpressure > 1015
  AND humidity >= 98;

-- Part 2: List the dates with unsuitable weather
SELECT DISTINCT log_date
FROM weatherdata
WHERE airpressure > 1015
  AND humidity >= 98;
  -- Here we can also define limit for how many outputs do we need

-- 5. Identify the top airlines ordered by total revenue (top 20)
SELECT al.airlinename, SUM(b.price) AS total_revenue
FROM booking b
JOIN flight f ON b.flight_id = f.flight_id
JOIN airline al ON f.airline_id = al.airline_id
GROUP BY al.airlinename
ORDER BY total_revenue DESC
LIMIT 20;
