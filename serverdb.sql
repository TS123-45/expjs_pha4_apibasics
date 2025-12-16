create database frontplusback;

use frontplusback;

CREATE TABLE places_to_visit (
    place_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),            
    description TEXT,             
    location VARCHAR(255),        
    category VARCHAR(100),        
    rating FLOAT(10),           
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(255),      
    event_description TEXT,       
    event_location VARCHAR(255),  
    start_date DATETIME,          
    end_date DATETIME,            
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 1. Coho Flats Trail
INSERT INTO places_to_visit
(name, description, location, category,rating)
VALUES
(
  'Coho Flats Trail',
  'An easy 2 km one-way trail leading along the Kitimat River, offering peaceful riverside views and fairly level walking. Great for a relaxed nature walk.',
  'Kitimat, BC',
  'Nature / Hiking',
  4.2
);

-- 2. Hirsch Creek Canyon Trail
INSERT INTO places_to_visit
(name, description, location, category, rating)
VALUES
(
  'Hirsch Creek Canyon Trail',
  'Approximately 4 km one-way trail. Offers forested paths, creek views and access to mountain scenery. One route includes a canyon viewpoint.',
  'Kitimat, BC',
  'Adventure / Hiking',
  4.5
);

-- 3. Snailtrail Mountain Bike Trail
INSERT INTO places_to_visit
(name, description, location, category, rating)
VALUES
(
  'Snailtrail',
  'A short (≈1 km) mountain bike trail on Haisla Hill. Singletrack style, easy difficulty, good for beginners and casual bikers. Beautiful surroundings and great for quick rides.',
  'Haisla Hill, Kitimat, BC',
  'Adventure / Mountain Biking',
  3.8
);

-- 1. Canada Day Celebrations
INSERT INTO events
(event_name, event_description, event_location, start_date, end_date)
VALUES
(
  'Canada Day Celebrations',
  'Festivals Kitimat hosts a day-long celebration with live music, food, games, a helicopter rides, fireworks and more to mark Canada Day.', 
  'Riverlodge Recreation Centre, Kitimat, BC', 
  '2025-07-01 10:00:00', 
  '2025-07-01 22:00:00'
);

-- 2. Craft Fair
INSERT INTO events
(event_name, event_description, event_location, start_date, end_date)
VALUES
(
  'Craft Fair',
  'Local artisans and crafters display their handmade goods. A great place to find unique gifts. Food and drinks available. Admission fee required.', 
  '654 Columbia Avenue West, Kitimat, BC', 
  '2025-11-07 17:30:00', 
  '2025-11-08 15:30:00'
);

-- 3. Free Family New Year''s Eve
INSERT INTO events
(event_name, event_description, event_location, start_date, end_date)
VALUES
(
  'Free Family New Year''s Eve',
  'Celebrate New Year''s Eve with free skating, swimming, and family friendly events downtown. Perfect for all ages.', 
  'Tamitik Jubilee Sports Complex, Kitimat, BC', 
  '2025-12-31 18:00:00', 
  '2025-12-31 23:59:00'
);

select * from places_to_visit;
select * from events;

CREATE TABLE viewtable (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  age INT,
  city VARCHAR(100)
);

INSERT INTO viewtable (name, age, city)
VALUES
('Tony', 20, 'Chennai'),
('Ravi', 25, 'Mumbai'),
('Priya', 22, 'Delhi');

SELECT * FROM viewtable;

