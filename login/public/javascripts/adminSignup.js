var express = require('express');
var router = express.Router();

function userGrantRole(username, adminState){
  if(adminState){
    router.get('/result', function(req, res, next) {
      //Connect to the database
      req.pool.getConnection( function(err,connection) {
        if (err) {
          res.sendStatus(500);
          return;
        }
        var query = "GRANT avgUser, admin TO ?";
        var value = [username];
        connection.query(query, function(err, rows, fields) {
          connection.release(); // release connection
          if (err) {
            res.sendStatus(500);
            return;
          }
          res.json(rows); //send response
        });
      });
    });
  } else if (adminState == 0){
    router.get('/result', function(req, res, next) {
      //Connect to the database
      req.pool.getConnection( function(err,connection) {
        if (err) {
          res.sendStatus(500);
          return;
        }
        var query = "GRANT avgUser TO ?";
        var value = [username];
        connection.query(query, function(err, rows, fields) {
          connection.release(); // release connection
          if (err) {
            res.sendStatus(500);
            return;
          }
          res.json(rows); //send response
        });
      });
    });
  }
}


function createDbUser(fName,lName, pass){
  var userName = string(fName + lName);
  var pwd = pass;

  router.get('/result', function(req, res, next) {
    //Connect to the database
    req.pool.getConnection( function(err,connection) {
      if (err) {
        res.sendStatus(500);
        return;
      }
      var query = string("CREATE USER " + userName + " IDENTIFIED BY " + pwd) ;
      connection.query(query, function(err, rows, fields) {
        connection.release(); // release connection
        if (err) {
          res.sendStatus(500);
          return;
        }
        res.json(rows); //send response
      });
    });
  });

 }


function signUp(){
    /* To create a new user entry on the user table*/
    /*Obtain data from user input*/
    var fName = string(document.getElementById("firstName"));
    var lName = string(document.getElementByID("lastName"));
    var eMail = string(document.getElemenyByID("email"));
    var passWord = string(document.getElementById("password"));

    createDbUser(fName, lName, pass);
    userGrantRole(string(fName+lName), 1);

    router.get('/result', function(req, res, next) {
        //Connect to the database
        req.pool.getConnection( function(err,connection) {
          if (err) {
            res.sendStatus(500);
            return;
          }
          var query = "INSERT INTO users (first_name, last_name, email, password) VALUES ?";
          var values = [fName, lName, eMail, passWord]
          connection.query(query, [values], function(err, rows, fields) {
            connection.release(); // release connection
            if (err) {
              res.sendStatus(500);
              return;
            }
            res.json(rows); //send response
          });
        });
      });
}