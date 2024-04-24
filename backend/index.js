const express = require("express");
const mongoose = require("mongoose");
const app = express();

var jwt = require("jsonwebtoken");

const uri = "mongodb+srv://masa:masadb123@atlascluster.3hxfex9.mongodb.net/";
async function connectDB() {
  try {
    await mongoose.connect(uri);
    console.log("Connected to MongoDB");
  } catch (error) {
    console.error(error);

  }
}
app.use(express.json({ extended: false }));
const schema = new mongoose.Schema({
    email: String,
    password: String,
    firstName: String,
    secondName: String,
  });
  //const Tank = mongoose.model('Tank', schema);
  var User = mongoose.model("User", schema);
app.post("/signup", async (req, res) => {
  const { email, password, firstName, secondName } = req.body;

   let user = await User.findOne({ email });

  if(user){
    return res.json({msg:"email already taken"});
  }
 // const hashedPass=await bcrypt.hash(hashedPass,8)
   user = new User({
    email,
    password,
    firstName,
    secondName,
  });
  console.log(user);
  //return res.send("signup api rout");
  await user.save();
  var token = jwt.sign({ id: user.id }, "password");

  return res.json({ token: token });
});
app.use((req, res, next) => {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
    next();
  });
  

//login
app.post("/login", async (req, res) => {
  const { email, password } = req.body;
  console.log(email);
  let user = await User.findOne({ email });
  console.log(user);
  if(!user){
    return res.json({msg:"no user found with that email"});
  }
  if (user.password != password) {
    return res.json({ msg: "password is not correct" });
  }

  var token = jwt.sign({ id: user.id }, "password");

  return res.json({ token: token });
});

connectDB();

app.listen(5000, () => console.log("Connected to Server at 5000"));
