var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var session = require('express-session');
var logger = require('morgan');
var mysql = require('mysql');
var nodemailer = require('nodemailer');

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');

var app = express();

var dbConnectionPool = mysql.createPool({ host: 'localhost', database: 'projectDB'});
app.use(function(req,res,next){
  req.pool = dbConnectionPool;
  next();
});

/*
var transporter = nodemailer.createTransport({
  service: 'live',
  auth:{
    user: 'WDCprojectemail@gmail.com',
    pass: 'WDCprojectemail1'
  }
});

var transporter = nodemailer.createTransport(smtpConfig);

var mailOptions = {
  from: 'WDCprojectemail@gmail.com'',
  to: 'WDCprojectemail@gmail.com'',
  subject: 'Sending test email',
  text: 'hi there'
};

transporter.sendMail(mailOptions, function(error, info){
  if(error){
    console.log(error);
  }else{
    console.log('Email sent: ' + info.response);
  }
});
*/
// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());

app.use(session({
  secret: 'hellooo',
  resave: false,
  saveUninitialized: true,
  cookie: { secure: false }
}));

app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/users', usersRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
