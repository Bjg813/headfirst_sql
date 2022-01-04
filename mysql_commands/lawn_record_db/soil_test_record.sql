-- Create table ow to create a table
CREATE TABLE soil_test_record 
    (
        id CHAR(1) NOT NULL, 
        date_applied DATE NOT NULL, 
        type_plant CHAR(25) NOT NULL, 
        ph_level DEC(3,2) NOT NULL, 
        nitrogen_reading CHAR(20) NOT NULL, 
        phosphorus_reading CHAR(20) NOT NULL, 
        potassium_reading CHAR(20) NOT NULL, 
        nitrogen_per_2000_sqft INT NOT NULL, 
        phosphorus_per_2000_sqft INT NOT NULL, 
        potassium_per_2000_sqft INT NOT NULL, 
        comments VARCHAR(225) NOT NULL DEFAULT 'No Comments'
    );

-- Add values to the soil_test_record table
INSERT INTO soil_test_record
(id, date_applied, type_plant, ph_level, nitrogen_reading, phosphorus_reading, potassium_reading, nitrogen_per_2000_sqft, phosphorus_per_2000_sqft, potassium_per_2000_sqft, comments)
VALUES 
('A', '2020-08-09', 'Tall Fescue', 6, 'Low', 'High', 'Medium Low', 8, 6, 7, 'samples taken during 100 degree heat');

-- Record #2
INSERT INTO soil_test_record
(id, date_applied, type_plant, ph_level, nitrogen_reading, phosphorus_reading, potassium_reading, nitrogen_per_2000_sqft, phosphorus_per_2000_sqft, potassium_per_2000_sqft, comments)
VALUES 
('B', '2020-08-09', 'Tall Fescue', 6, 'Low', 'High', 'Medium Low', 8, 6, 7, 'Sample Taken From The Backyard Across From Hose On Opposite Side Of Lawn');

-- Record #3
INSERT INTO soil_test_record
(id, date_applied, type_plant, ph_level, nitrogen_reading, phosphorus_reading, potassium_reading, nitrogen_per_2000_sqft, phosphorus_per_2000_sqft, potassium_per_2000_sqft, comments)
VALUES 
('C', '2020-08-09', 'Tall Fescue', 6, 'Low', 'High', 'Medium Low', 8, 6, 7, 'Backyard Next To Metal Purple Table');

-- Record #4
INSERT INTO soil_test_record
(id, date_applied, type_plant, ph_level, nitrogen_reading, phosphorus_reading, potassium_reading, nitrogen_per_2000_sqft, phosphorus_per_2000_sqft, potassium_per_2000_sqft, comments)
VALUES 
('D', '2020-08-09', 'Tall Fescue', 4, 'Low', 'High', 'Medium Low', 8, 6, 7, 'Backyard Next To Patio Under Tree');

-- Record #5
INSERT INTO soil_test_record
(id, date_applied, type_plant, ph_level, nitrogen_reading, phosphorus_reading, potassium_reading, nitrogen_per_2000_sqft, phosphorus_per_2000_sqft, potassium_per_2000_sqft, comments)
VALUES 
('E', '2020-08-09', 'Bermuda Grass', 7, 'Trace', 'Medium', 'Medium Low', 10, 8, 7, 'Sample Taken From The Front Yard');