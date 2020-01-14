'use strict'

var User = require('../models/role');

module.exports.getRole = async function (req, res){

    var userId = req.params.id;

    User.findById(userId, (err, user) => {
        
        if(err)return res.status(500).send({message: err});
        
        if(!user) return res.status(404).send({message: 'EL usuario no existe'});
       
        res.send({message: user})
    });
}

module.exports.getAllRole = async function (req, res){

    User.find({}, (err, users) => {
        if(err)return res.status(500).send({message: err});
        res.send({users: users});
     });
}

module.exports.createRole = async function (req, res){

    let role = new Role({
        name:       req.body.name,
        description:    req.body.description,
    })

    role.save((err)=>{
        if(err){
            return res.status(500).send({message: err}) 
        }
        res.send({message:'Role created successfully'})
    })
}



