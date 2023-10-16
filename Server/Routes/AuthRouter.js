const express =require('express');
const Users = require('../Models/Users');
const bcrypt = require('bcryptjs');


const authRouter = express.Router();

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

module.exports=authRouter;