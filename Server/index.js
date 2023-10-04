const express = require('express');
const authRouter = require('./Routes/AuthRouter');
const mongoose = require('mongoose');
const app = express();

const PORT = 3000;

app.use(authRouter);

mongoose.connect(db).then(()=>{
    console.log('Connection Successfull!');
}).catch((e)=>{
    console.log(e);
});

app.listen(PORT ,()=>{
    console.log('connected to port number',PORT)
});
