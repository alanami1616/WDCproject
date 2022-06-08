/*SQL commands for needed user table interactions*/

/*Admin options commands*/

/*USER create command*/

CREATE USER '$username'
  IDENTIFIED BY 'password' ;

//User privileges command
GRANT $systemPrivilege [, systemprivilege, ...]
  TO $userName [, username|roleName, ...]
    [WITH ADMIN OPTION];
/* EG.
  GRANT CREATE SESSION
    TO rthomas;
*/

/*Password management*/
ALTER USER $username
  IDENTIFIED BY 'newPassword'
  [PASSWORD EXPIRE];

/*Role creation and assignment*/
CREATE ROLE $roleName;

GRANT $systemPrivilege [, systemPrivilege,...]
  ON tableName
  TO roleName

/*Removing privileges*/
REVOKE $systemPrivilege [, systemPrivilege,...]
  FROM userName|roleName ;

/*Remove User*/
DROP USER $userName;

/*User table details acquisition*/
INSERT INTO users (first_name, last_name, email, password)
  VALUES ($fName, $lName, $eMail, $passWord)

/*User table details editing*/
UPDATE users
  SET &userCol = $newVal
  WHERE user_id === $foundUserId;