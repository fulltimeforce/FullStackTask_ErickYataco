'use strict'

var User = require('../models/user');

module.exports.getUser = async function (req, res){

    var userId = req.params.id;

    User.findById(userId, (err, user) => {
        
        if(err)return res.status(500).send({message: err});
        
        if(!user) return res.status(404).send({message: 'EL usuario no existe'});
       
        res.send({message: user})
    });
}

module.exports.getAllUser = async function (req, res){

    User.find({}, (err, users) => {
        res.send({users: users});
     });
}

module.exports.test = async function (req, res){

    return res.status(200).send({message:'working'})
}

module.exports.createUser = async function (req, res){

    let user = new User({
        name:       req.body.name,
        surname:    req.body.surname,
        nick:       req.body.nick,
        email:      req.body.email,
        password:   req.body.password,
        role:       req.body.role
        
    })

    user.save((err)=>{
        if(err){
            return res.status(500).send({message: err}) 
        }
        res.send({message:'User created successfully'})
    })
}



