const express = require('express');
const app = express();
const myRoute = require('./routes/route.js');
const bodyParser = require('body-parser');

//Middleware
app.use(bodyParser.urlencoded({extended: false}));

app.use('/', myRoute);

app.listen(3000);