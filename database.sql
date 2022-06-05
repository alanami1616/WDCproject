
CREATE TABLE users(
    user_id INT NOT NULL AUTO_INCREMENT, 
    first_name VARCHAR(63), 
    last_name VARCHAR(63),
    email VARCHAR(127), 
    password VARCHAR(225), 
    PRIMARY KEY (user_id) 
); 
 
INSERT INTO users (first_name, last_name, email, password)
VALUES ('John', 'Smith','email@test.com', 'Password');

CREATE TABLE location(
    location_id INT NOT NULL AUTO_INCREMENT, 
    country VARCHAR(63), 
    city VARCHAR(63), 
    street_name VARCHAR(63),  
    street_number INT NOT NULL, 
    PRIMARY KEY (location_id)
); 
INSERT INTO location (country, city, street_name, street_number)
VALUES ('Australia', 'Adelaide', 'Street', 21);


CREATE TABLE guest_users(
    guest_user_id INT NOT NULL AUTO_INCREMENT, 
    first_name VARCHAR(63), 
    last_name VARCHAR(63),
    PRIMARY KEY (guest_user_id)
); 

INSERT INTO guest_users (first_name, last_name)
VALUES ('Iam', 'aGuest');

CREATE TABLE events(
    event_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(63),
    date_time DATETIME,   
    PRIMARY KEY (event_id), 
    location_id INT, 
    user_id INT,
    guest_user_id INT,
    FOREIGN KEY (location_id) REFERENCES location(location_id) ON DELETE SET NULL, 
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE SET NULL,
    FOREIGN KEY (guest_user_id) REFERENCES guest_users(guest_user_id) ON DELETE SET NULL
);

INSERT INTO events (name, date_time)
VALUES ('Birthday', '2022-05-21 03:30:00');

CREATE TABLE invite_status(
    invite_status_id INT NOT NULL AUTO_INCREMENT, 
    event_response INT,
    user_id INT,
    guest_user_id INT,
    event_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE SET NULL, 
    FOREIGN KEY (guest_user_id) REFERENCES guest_users(guest_user_id) ON DELETE SET NULL,
    FOREIGN KEY (event_id) REFERENCES events(event_id) ON DELETE SET NULL,
    PRIMARY KEY (invite_status_id)
); 

--
-- going to the event is 1 not going 0 and 2 is invited (not responed yet)
--

INSERT INTO invite_status (event_response)
VALUES (0); 
INSERT INTO invite_status (event_response)
VALUES (1);
