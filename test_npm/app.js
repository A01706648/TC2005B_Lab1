console.log("Hello World");

const express = require('express');
const bodyParser = require('body-parser');
const app = express();

//Middleware
app.use((request, response, next) => {
    console.log('Middleware!');
    next(); // Allow the request to advance to the next middleware
});

app.use('/ruta', (request, response, next) => {
    response.send('Respuesta de la ruta "/ruta"'); 
});

app.use(bodyParser.urlencoded({extended: false}));

app.use('/some-ruta', (request, response, next) => {
    console.log(request.body);
});

app.use((request, response, next) => {
    console.log('Otro middleware!');
    response.send('HelloWorld'); // Send the answer
});


app.listen(3000);