var express = require('express');
var app = module.exports = express();
app.get('/', function(req, res) {
    res.send('sc-srv root, so suck it! :)')
});
app.listen(8080, function() {
    console.log('your port is 8080, fuckwad!')
});
