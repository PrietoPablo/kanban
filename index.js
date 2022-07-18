const express = require('express');
const cors = require('cors');

require('dotenv').config();

const router = require('./app/router');

const app = express()
const port = process.env.PORT || 3000;

app.use(express.urlencoded({extended : true}));

app.use(cors({
    origin: "*"
}));

const multer = require('multer');
const bodyParser = multer();

app.use( bodyParser.none() );

app.use(router);

app.listen(port, () => {
    console.log(`kanban app listening on port ${port}`)
})