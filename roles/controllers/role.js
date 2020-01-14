'use strict'

var Role = require('../models/role');

module.exports.getRole = async function (req, res){

    var userId = req.params.id;

    Role.findById(roleId, (err, user) => {
        
        if(err)return res.status(500).send({message: err});
        
        if(!user) return res.status(404).send({message: 'EL rol no existe'});
       
        res.send({message: user})
    });
}

module.exports.getAllRole = async function (req, res){

    Role.find({}, (err, roles) => {
        if(err)return res.status(500).send({message: err});
        res.send({roles: roles});
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



