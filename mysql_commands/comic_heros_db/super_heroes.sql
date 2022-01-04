CREATE TABLE super_heroes (
    name VARCHAR(100) NOT NULL,
    power VARCHAR(100) NOT NULL,
    weakness VARCHAR(100)
);

INSERT INTO super_heroes
    (
        name, power, weakness
    )
    VALUES
    (
        'Super Trashman', 'Cleans quickly', 'bleach'
    ),
    (
        'The Broker', 'Makes money from nothing', ''
    );