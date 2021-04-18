const express = require('express');
const app = express();
//const myRoute = require('./routes/route.js');
const bodyParser = require('body-parser');
const path = require('path');

const homeRoute = require(path.join(__dirname, "routes", "homeRoute.js"));

//use EJS as view layer engine, use views folder to store html files
app.set('view engine', 'ejs');
app.set('views', 'views');

//make the public folder static
app.use(express.static(path.join(__dirname, 'public')));

//use BodyParser
app.use(bodyParser.urlencoded({extended: false}));

//Middleware
//app.use('/', myRoute);
app.use('/home', homeRoute);
app.use('/project', projectRoute);
app.use('/story', storyRoute);
app.use('/task', storyRoute);
app.use('/test', testRoute);
app.use('/user', userRoute);

app.listen(3000);