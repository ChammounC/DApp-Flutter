const express = require("express");

require("dotenv").config();

const getTokenBalance = require("./controllers/getTokenBalance");

const app = express();

const bodyParser = require("body-parser");
const cors = require("cors");

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.use(cors());

app.get("/getTokenBalance", getTokenBalance);

app.listen(process.env.PORT || 8080, () => {
  console.log("server listening");
});
