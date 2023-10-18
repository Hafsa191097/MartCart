const express =require('express');
const Users = require('../Models/Users');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

const authRouter = express.Router();


// SIGNUP ROUTE

authRouter.post('/api/signup',async (req,res)=>{
    try {
        const {Name,Email,Password} = req.body;
        const existingUser = await Users.findOne({Email});
        if (existingUser) {
            return res.status(400).json({msg: 'User with same email already exists!'});
        }
        const hashedPass = bcrypt.hash(Password,8);
        let user = new Users({
            Name,
            Email,
            Password: (await hashedPass).toString(),
        });
        user = await user.save();
        res.json(user);
    } catch (e) {
        res.status(500).json({error: e.message});
    }
});


// SIGNIN ROUTE


authRouter.post('/api/signin',async (req,res)=>{
    try {
        const {Email,Password} = req.body;
        const user = await Users.findOne({Email});
        if (!user) {
            return res.status(400).json({msg: 'User with this email doesnt exist!'});
        }
        const isMatch = await bcrypt.compare(Password,user.Password);
        if(!isMatch){
            return res.status(400).json({msg: 'Incorrect Password!'});
        }
        const jsonwebtoken= jwt.sign({id: user._id},"passwordkey");
        res.json({jsonwebtoken,...user._doc});
    } catch (e) {
        res.status(500).json({error: e.message});
    }
});


module.exports=authRouter;