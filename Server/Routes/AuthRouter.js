const express =require('express');

const authRouter = express.Router();

authRouter.put('/api/signup',(req,res)=>{
    const {Name,Email,Password} = req.body;
});

module.exports=authRouter;