CREATE TABLE users(
    user_id INT AUTO_INCREMENT, 
    first_name VARCHAR(63), 
    last_name VARCHAR(63),
    email VARCHAR(127), 
    password VARCHAR(225), 
      CONSTRAINT users_userid_pk PRIMARY KEY (user_id) 
); 
 
INSERT INTO users (first_name, last_name, email, password)
VALUES ('John', 'Smith','email@test.com', 'Password');

CREATE TABLE location(
    location_id INT AUTO_INCREMENT, 
    country VARCHAR(63), 
    city VARCHAR(63), 
    street_name VARCHAR(63),  
    street_number INT NOT NULL, 
      CONSTRAINT location_locationid_pk PRIMARY KEY (location_id)
); 
INSERT INTO location (country, city, street_name, street_number)
VALUES ('Australia', 'Adelaide', 'Street', 21);


CREATE TABLE guest_users(
    guest_user_id INT AUTO_INCREMENT, 
    first_name VARCHAR(63), 
    last_name VARCHAR(63),
      CONSTRAINT guestusers_guestuserid_pk PRIMARY KEY (guest_user_id)
); 

INSERT INTO guest_users (first_name, last_name)
VALUES ('Iam', 'aGuest');

CREATE TABLE events(
    event_id INT AUTO_INCREMENT,
    name VARCHAR(63),
    date_time DATETIME,   
    location_id INT, 
    user_id INT,
    guest_user_id INT,
      CONSTRAINT events_eventid_pk PRIMARY KEY (event_id),
      CONSTRAINT events_locationId_fk FOREIGN KEY (location_id) 
        REFERENCES location (location_id) ON DELETE SET NULL, 
      CONSTRAINT events_userId_fk FOREIGN KEY (user_id) 
        REFERENCES users (user_id) ON DELETE SET NULL,
      CONSTRAINT events_guestUserId_fk FOREIGN KEY (guest_user_id) 
        REFERENCES guest_users (guest_user_id) ON DELETE SET NULL
);

INSERT INTO events (name, date_time)
VALUES ('Birthday', '2022-05-21 03:30:00');

CREATE TABLE invite_status(
    invite_status_id INT AUTO_INCREMENT, 
    event_response INT,
    user_id INT,
    guest_user_id INT,
    event_id INT,
      CONSTRAINT inviteStatus_inviteStatusId_pk PRIMARY KEY (invite_status_id),
      CONSTRAINT inviteStatus_userID_fk FOREIGN KEY (user_id)
        REFERENCES users (user_id) ON DELETE SET NULL, 
      CONSTRAINT inviteStatus_guestUserId_fk FOREIGN KEY (guest_user_id) 
        REFERENCES guest_users (guest_user_id) ON DELETE SET NULL,
      CONSTRAINT inviteStatus_eventId_fk FOREIGN KEY (event_id) 
        REFERENCES events (event_id) ON DELETE SET NULL
); 

--
-- going to the event is 1 not going 0 and 2 is invited (not responed yet)
--

INSERT INTO invite_status (event_response)
VALUES (0); 
INSERT INTO invite_status (event_response)
VALUES (1);

desc users;

desc location;

desc guest_users;

desc events;

desc invite_status;


select *
  FROM users;
  
select *
  FROM location;
  
select *
  FROM guest_users;
  
select *
  FROM events;
  
select *
  FROM invite_status;
  
UPDATE invite_status
  SET guest_user_id = 1
  WHERE invite_status_id = 1;
  
UPDATE invite_status
  set event_id = 1
  WHERe invite_status_id = 1;

UPDATE invite_status
  SET user_id = 1
  WHERE invite_status_id = 1; 
  
select *
  FROM invite_status;
 
