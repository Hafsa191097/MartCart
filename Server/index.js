const express = require('express');
const authRouter = require('./Routes/AuthRouter');
const mongoose = require('mongoose');

const app = express();
app.use(express.json());
app.use(authRouter);

const PORT = 3000;

mongoose.connect(db).then(()=>{
    console.log('Connection Successfull!');
}).catch((e)=>{
    console.log(e);
});

app.listen(PORT ,"0.0.0.0" ,()=>{
    console.log('connected to port number',PORT)
});
