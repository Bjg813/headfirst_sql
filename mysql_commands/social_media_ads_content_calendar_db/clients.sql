CREATE TABLE headlines (
    headline_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    headline VARCHAR(100)
);

CREATE TABLE descriptions (
    description_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(250)
);

CREATE TABLE images (
    image_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    image BLOB
);

CREATE TABLE start_dates (
    start_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    start_date DATE
);

CREATE TABLE end_dates (
    end_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    end_date DATE
);

CREATE TABLE audiences (
    audience_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    audience VARCHAR(100)
);

CREATE TABLE notes (
    note_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    note_text VARCHAR(250)
);

CREATE TABLE ads (
    ad_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ad_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    headline_id INT NOT NULL,
    INDEX `idx_headlines`(headline_id),
    CONSTRAINT headlines_headline_id_fk
    FOREIGN KEY (headline_id)
    REFERENCES headlines (id) ON UPDATE CASCADE ON DELETE RESTRICT,
    description_id INT NOT NULL,
    INDEX `idx_descriptions`(description_id),
    CONSTRAINT descriptions_description_id_fk
    FOREIGN KEY (description_id)
    REFERENCES descriptions (id) ON UPDATE CASCADE ON DELETE RESTRICT,
    image_id INT NOT NULL,
    INDEX `idx_images`(image_id),
    CONSTRAINT images_image_id_fk
    FOREIGN KEY (image_id)
    REFERENCES images (id) ON UPDATE CASCADE ON DELETE RESTRICT,
    audience_id INT NOT NULL,
    INDEX `idx_audiences`(audience_id),
    CONSTRAINT audiences_audience_id_fk
    FOREIGN KEY (audience_id)
    REFERENCES audiences (id) ON UPDATE CASCADE ON DELETE RESTRICT,
    note_id INT NOT NULL,
    INDEX `idx_notes`(note_id),
    CONSTRAINT notes_note_id_fk
    FOREIGN KEY (note_id)
    REFERENCES notes (id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE client_ads (
    ad_id INT NOT NULL,
    INDEX `idx_ads`(ad_id),
    CONSTRAINT ads_id_fk 
    FOREIGN KEY (ad_id)
    REFERENCES ads (ad_id) ON UPDATE CASCADE ON DELETE RESTRICT,
    client_id INT NOT NULL,
    INDEX `idx_clients`(client_id),
    CONSTRAINT clients_id_fk 
    FOREIGN KEY (client_id)
    REFERENCES clients (id) ON UPDATE CASCADE ON DELETE RESTRICT,
    PRIMARY KEY (ad_id, client_id)
);

-- Audience: Recovery Groups
INSERT INTO audiences (audience) VALUES ('Recovery Groups');
INSERT INTO headlines (headline) VALUES ('The Struggle Is Real');
INSERT INTO descriptions (description) VALUES ('Addiction is a disease. If you or a loved one is using meth, recovery can feel like a tough, endless journey. But you don’t have to do it alone. Call us to get help.');
INSERT INTO images (image) VALUES (LOAD_FILE('/Users/brennan/Desktop/uptown/clients/lets-talk-meth/fb-images/man-holding-knees-1080-1080.png'));
INSERT INTO notes (note_text) VALUES ('Addiction is spelled wrong.');

-- Add data to Ads table
INSERT INTO ads 
(
    ad_name, start_date, end_date, headline_id, description_id, image_id, audience_id, note_id 
)
VALUES
(
    'Man holding knees', '2021-02-12', '2021-02-12', 1, 1, 1, 1, 1
);

-- Add data to clients table
INSERT INTO clients
(
    client
)
VALUES
(
    'Let''s Talk Meth'
);

-- Add data to client_ads table
INSERT INTO client_ads
(
    ad_id, client_id
)
VALUES
(
    1, 1
);

-- Find ad name from client_id #1
SELECT ads.ad_name, ads.start_date, ads.end_date 
FROM ads 
NATURAL JOIN 
client_ads ca 
WHERE ca.client_id = 1;


