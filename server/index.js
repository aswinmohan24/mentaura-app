const express = require("express");
const mongoose = require("mongoose");
const admin = require("firebase-admin");
const serviceAccount = require("./serviceAccountKey.json");
const authRouter = require("./routes/auth");
const emotionRouter = require("./routes/emotion");
require('dotenv').config();
const PORT = process.env.PORT | 3001;


const app = express();

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

app.use(express.json());
app.use(authRouter)
app.use(emotionRouter)

mongoose.connect(process.env.DB).then(()=>{
    console.log("Connection successfull")
}).catch((err)=>{
    console.log(err);
})

app.listen(PORT,"0.0.0.0", () =>{
console.log(`connected at port ${PORT}`);
} ,);