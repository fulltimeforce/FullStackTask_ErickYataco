'use strict'

var express = require('express');
var UserController = require('../controllers/user');

var api = express.Router();
//var md_auth = require('../middlewares/authenticated');

//api.get('/user/:id', md_auth.ensureAuth, UserController.getUser);

api.get('/user/:id', UserController.getUser);
api.get('/user/all', UserController.getAllUser);
api.post('/user', UserController.createUser);
// Exportamos la configuración
module.exports = api;