const express = require('express');
const app = express();
//const myRoute = require('./routes/route.js');
const bodyParser = require('body-parser');
const path = require('path');

const cookieParser = require('cookie-parser')
const session = require('express-session');

/*import the router*/
const homeRoute = require(path.join(__dirname, "routes", "homeRoute.js"));
const projectRoute = require(path.join(__dirname, "routes", "projectRoute.js"));
const storyRoute = require(path.join(__dirname, "routes", "storyRoute.js"));
const loginRoute = require(path.join(__dirname, "routes", "loginRoute.js"));

//use EJS as view layer engine, use views folder to store html files
app.set('view engine', 'ejs');
app.set('views', 'views');

//make the public folder static
app.use(express.static(path.join(__dirname, 'public')));

//use BodyParser
// For easy access to body data
app.use(bodyParser.urlencoded({extended: false}));

//Middleware
app.use((request, response, next) => {
    console.log('Middleware!');
    next(); //Le permite a la petición avanzar hacia el siguiente middleware
});

// To access the cookie values
app.use(cookieParser());
//for work with session
app.use(session({
    secret: 'kñsjdnrkncllñkm', 
    resave: false, // The session will not be saved on every request, it will only be saved if something changed
    saveUninitialized: false, // Ensures that a session is not saved for a request that does not need it
}));

app.get('/', (request, response, next) => {
    console.log("Redirect to Login");
    response.redirect('/login');
});

//app.use('/', myRoute);
app.use('/home', homeRoute);
app.use('/project', projectRoute);
app.use('/story', storyRoute);
app.use('/login', loginRoute);
/*
app.use('/task', storyRoute);
app.use('/test', testRoute);
app.use('/user', userRoute);
*/

app.use( (request, response, next) => {
    //response.statusCode = 404;
    response.status(404);
    response.send('Page Not Found'); 
} );

app.listen(3000);