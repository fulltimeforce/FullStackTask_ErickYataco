'use strict'

var express = require('express');
var RoleController = require('../controllers/role');

var api = express.Router();

api.get('/role/:id', RoleController.getRole);
api.get('/roles', RoleController.getAllRole);
api.post('/role', RoleController.createRole);
// Exportamos la configuración
module.exports = api;