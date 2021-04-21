const express = require('express');
const router = express.Router();
const userControl = require("../controller/userControl.js");



router.get('/login', userControl.getLogin);
router.post('/login', userControl.postLogin);
router.get('/logout', userControl.getLogout);

module.exports = router;