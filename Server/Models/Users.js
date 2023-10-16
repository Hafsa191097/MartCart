const mongoose = require('mongoose');

const UserScema = mongoose.Schema({
    Name: {
        type: String,
        required: true,
        trim: true,
    },
    Email: {
        type: String,
        required: true,
        trim:true,
        validate: {
            validator: (value)=>{
                const regex =/^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/;
                return value.match(regex);
            },
            message: 'Please Enter Valid Email' 
        }
    },
    Password: {
        type: String,
        required: true, 
        validate: {
            validator: (value)=>{
               return value.length > 8
            },
            message: 'Please Enter Password with length greater than 8!'
        }  
    },
    Address: {
        type: String,
        default : ''  
    },
    Type: {
        type: String,
        default : 'User'  
    },
});


const Users = mongoose.model("User", UserScema);

module.exports = Users;