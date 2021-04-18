const express = require('express');
const path = require('path');
const router = express.Router();
const fs = require('fs');

router.get('/', (request, response, next) => {
    response.sendFile(path.join(__dirname, '..','public', 'login.html'));
});

router.post('/submit', (request, response, next) => {
    console.log(request.body);
    fs.writeFileSync("LoginData", `User:${request.body.uid}, Psw:${request.body.password}`);
    response.redirect('/home');
});

module.exports = router;