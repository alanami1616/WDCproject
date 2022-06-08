CREATE TABLE users(
    user_id INT AUTO_INCREMENT,
    first_name VARCHAR(63),
    last_name VARCHAR(63),
    email VARCHAR(127),
    password VARCHAR(225),
      CONSTRAINT users_userid_pk PRIMARY KEY (user_id)
);


CREATE TABLE location(
    location_id INT AUTO_INCREMENT,
    country VARCHAR(63),
    city VARCHAR(63),
    street_name VARCHAR(63),
    street_number INT NOT NULL,
      CONSTRAINT location_locationid_pk PRIMARY KEY (location_id)
);


CREATE TABLE guest_users(
    guest_user_id INT AUTO_INCREMENT,
    first_name VARCHAR(63),
    last_name VARCHAR(63),
      CONSTRAINT guestusers_guestuserid_pk PRIMARY KEY (guest_user_id)
);


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