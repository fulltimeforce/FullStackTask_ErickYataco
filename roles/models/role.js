'use strict'

const mongoose =  require('mongoose');
const Schema = mongoose.Schema;

let RoleSchema = Schema({
    name: String,
    description: String
});

module.exports = mongoose.model('Role', RoleSchema);