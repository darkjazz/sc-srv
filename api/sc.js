var express = require('express');

module.sc = express.Router();

module.sc.get('/', function(req, res) {
	res.send('sc module root');
});

