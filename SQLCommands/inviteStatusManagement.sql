/*SQL commands for needed invite_status table interactions*/
/*invite status creation*/
INSERT INTO invite_status (event_response)
    VALUES (2);

UPDATE invite_status
    SET location_id = $foundLocationId
    WHERE invite_status_id === $foundInviteStatusID ;

UPDATE invite_status
    SET event_id = $foundEventId
    WHERE inviteStatus_id === $foundInviteStatusID ;

/*User on system ID*/
UPDATE invite_status
    SET user_id = $foundUserId
    WHERE invite_status_id === $foundInviteStatusID ;

/*Guest user Id*/
UPDATE invite_status
    set guest_user_id = $foundGuestId
    WHERE invite_status_id === $foundInviteStatusID ;

/*Giving an event response*/
UPDATE invite_status
    SET event_response = $eventResponse_in
    WHERE invite_status_id === $foundInviteStatusID ;