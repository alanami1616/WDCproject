/*SQL commands for needed events table interactions*/

/*event creation*/
INSERT INTO events (name, date_time)
  VALUES ($name_in, &dateTime_in)

UPDATE events
    SET location_id = $foundLocID
    WHERE event_id === $foundEventID ;

UPDATE events
    SET user_id = $foundUserId
    WHERE event_id === $foundEventID ;

UPDATE events
    SET guest_user_id = $foundGuestUserID
    WHERE event_id ===$foundEventID;

/*event modification*/
UPDATE events
    SET &eventCol = $newVal
    WHERE event_id === $foundEventId;