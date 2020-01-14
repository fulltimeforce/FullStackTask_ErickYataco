'use strict'

var express = require('express');
var UserController = require('../controllers/user');

var api = express.Router();

api.get('/user/:id', UserController.getUser);
api.get('/user', UserController.getAllUser);
api.post('/user', UserController.createUser);
api.get('/user/test/:id', UserController.test);
// Exportamos la configuración
module.exports = api;