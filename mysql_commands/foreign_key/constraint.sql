-- A foreign key can only be designated using CREATE or ALTER

-- You can use a foreign key to reference a unique value in the parent table

-- A foreign key doesn't have to be the primary key of the parent table, but it mus be unique

-- Creating a foreign key inside of a structure is called CONSTRAINT

-- You can only be able to insert values into your foreign key that exist in the table the key came from

-- You'll get errors if you violate the rules which will stop you accidentally doing anything to break the table

-- The Parent Table is called "referential integrity"

-- Referential Integrity means you can only put values in the child table's foreign key that already exists in the parent table

-- Create a interests table that has its own PRIMARY KEY and uses a contact_id FOREIGN KEY from the my_contacts table
CREATE TABLE interests(
    interests_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    interest VARCHAR(50) NOT NULL,
    contact_id INT NOT NULL,
    CONSTRAINT my_contacts_contact_id_fk
    FOREIGN KEY (contact_id)
    REFERENCES my_contacts (contact_id)
    );