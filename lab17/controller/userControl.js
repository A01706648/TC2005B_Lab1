const path = require('path');
const fs = require('fs');

exports.postLogin = (request, response, next) => {
    console.log(request.body);
    fs.writeFileSync("LoginData", `User:${request.body.uid}, Psw:${request.body.password}`);

    //to save the session data
    request.session.isLoggedIn = true;
    request.session.uid = request.body.uid;

    response.redirect('/home');
}

exports.getLogin = (request, response, next) => {
    console.log('login');
    response.sendFile(path.join(__dirname, '..','public', 'login.html'));
}

exports.getLogout = (request, response, next) => {
    request.session.destroy((err) => {
        console.log(err);
        console.log('Logout');
        response.redirect('/'); // This code runs when the session is dropped.
    });
};


