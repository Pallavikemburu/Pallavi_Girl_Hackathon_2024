const express = require("express");
const bodyParser = require("body-parser");

const InitiateMongoServer = require("./src/config/db");
const cors = require("cors");
const path = require('path');
const HackathonRouter = require('./src/routes/hackthonRoutes');

const app = express();
// for database connection just uncomment the below line
// InitiateMongoServer(); 
const PORT = process.env.PORT || 5010;
//cors
app.use(cors());
// Middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.json());

app.use('/', HackathonRouter);
app.get("/", (req, res) => {
  res.json({ message: "API Working" });
});


app.listen(PORT, (req, res) => {
  console.log(`Server Started at PORT ${PORT}`);
});