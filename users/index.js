'use strict'

var mongoose = require('mongoose');

var app = require('./app');

var port = 3000;

mongoose.Promise = global.Promise;

mongoose.connect('mongodb://localhost:27017/fulltimeforce',  { useMongoClient: true})
    .then(() => {

        console.log("successfull conection")
    
        
    })
    .catch(err => console.log(err));

// CREAR EL SERVIDOR WEB CON NODEJS
app.listen(port, () => {
    console.log("servidor corriendo en http://localhost:3000");
});