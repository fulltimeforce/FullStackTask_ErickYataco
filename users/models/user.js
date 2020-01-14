'use strict'

const mongoose =  require('mongoose');
const Schema = mongoose.Schema;

let UserSchema = Schema({
    name: String,
    surname: String,
    nick: String,
    email: String,
    password: String,
    role: String
    
});

module.exports = mongoose.model('User', UserSchema);