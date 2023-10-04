const express = require('express');
const authRouter = require('./Routes/AuthRouter');
const mongoose = require('mongoose');
const db = "mongodb+srv://hafsa:Hafsa_Here123@cluster0.oenrex9.mongodb.net/?retryWrites=true&w=majority&appName=AtlasApp";
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
