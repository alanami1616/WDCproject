/*SQL commands for needed guest_users table interactions*/
/*guest_user table details acquisition*/
INSERT INTO guest_users (first_name, last_name)
  VALUES ($fName, $lName);

/*guest_user table details editing*/
UPDATE guest_users
  SET &guestUserCol = $newVal
  WHERE guest_user_id === $foundGuestUserId;