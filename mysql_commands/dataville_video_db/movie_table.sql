CREATE TABLE movie_table (
    movie_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(225) NOT NULL,
    rating VARCHAR(10) NOT NULL,
    drama CHAR(1) NOT NULL,
    comedy CHAR(1) NOT NULL,
    action CHAR(1) NOT NULL,
    gore CHAR(1) NOT NULL,
    scifi CHAR(1) NOT NULL,
    for_kids CHAR(1) NOT NULL,
    cartoon CHAR(1) NOT NULL,
    purchased DATE NOT NULL,
    PRIMARY KEY (movie_id)
);

INSERT INTO movie_table
    (
        title, rating, drama, comedy, action, gore, scifi, for_kids, cartoon, purchased
    )
    VALUES
    (
        'Monsters, Inc.', 'G', 'F', 'T', 'F', 'F', 'F', 'T', 'T', '2002-3-6'
    ),
    (
        'The Godfather', 'R', 'F', 'F', 'T', 'T', 'F', 'F', 'F', '2001-2-5'
    ),
    (
        'Gone with the Wind', 'G', 'T', 'F', 'F', 'F', 'F', 'F', 'F', '1999-11-20'
    ),
    (
        'American Pie', 'R', 'F', 'T', 'F', 'F', 'F', 'F', 'F', '2003-4-19'
    ),
    (
        'Nightmare on Elm Street', 'R', 'F', 'F', 'T', 'T', 'F', 'F', 'F', '2003-4-19'
    ),
    (
        'Casablanca', 'PG', 'T', 'F', 'F', 'F', 'F', 'F', 'F', '2001-2-5'
    );