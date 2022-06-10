var express = require('express');
var router = express.Router();


router.post('/login', function(req, res, next) {

  if ('email' in req.body && 'password' in req.body) {
    req.pool.getConnection(function(error,connection){
      if(error){
        console.log(error);
        res.sendStatus(500);
        return;
      }

      let query = "SELECT user_id,first_name,last_name,email FROM users WHERE email = ? AND password = ?;";
      connection.query(query,[req.body.email,req.body.password],function(error, rows, fields) {
        connection.release(); // release connection
        if (error) {
          console.log(error);
          res.sendStatus(500);
          return;
        }
        if(rows.length > 0){
          console.log('success');
          req.session.user = rows[0];
          res.sendStatus(200);
        }else{
          console.log('bad login');
          res.sendStatus(401);
        }
      });

    });

  } else {
    console.log('bad request');
    res.sendStatus(400);
  }

});


module.exports = router;
