const express = require("express");
const mongoose = require("mongoose");
const admin = require("firebase-admin");
const serviceAccount = require("./serviceAccountKey.json");
const authRouter = require("./routes/auth");
const emotionRouter = require("./routes/emotion");
const PORT = process.env.PORT | 3001;
const DB = "mongodb+srv://wipergaming92:wiper9207@cluster0.sfguqjw.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

const app = express();

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

app.use(express.json());
app.use(authRouter)
app.use(emotionRouter)

mongoose.connect(DB).then(()=>{
    console.log("Connection successfull")
}).catch((err)=>{
    console.log(err);
})

app.listen(PORT,"0.0.0.0", () =>{
console.log(`connected at port ${PORT}`);
} ,);