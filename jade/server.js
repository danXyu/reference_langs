// Create an express server to serve static jade files on localhost.
var express = require('express');
var app = express();

// Establish middleware for express app.
app.set('port', process.env.PORT || 3000);
app.set('view engine', 'jade');

// Establish some simple routes.
app.get('/', function (req, res) {
  res.render('index');
});

// Start the express app.
app.listen(app.get('port'), function () {
  console.log('Express server now listening on port %d in %s mode.', app.get('port'), app.get('env'));
});


