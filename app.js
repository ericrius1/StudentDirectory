var app, express;

express = require('express');

app = express();

app.use(express["static"](__dirname + '/public'));

app.use(require('connect-assets')());

app.set('view engine', 'jade');

app.get('/', function(req, res) {
  return res.render('index');
});

app.listen(process.env.PORT || 5000, function() {
  return console.log('Express server listening on port 8000.');
});
