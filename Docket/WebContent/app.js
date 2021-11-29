const express = require('express');
const app = express();
const cors = require('cors');
const dotenv = require('dotenv');
dotenv.config();

const dbService = require('./database');

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended : false }));


// create
app.post('/insert', (request, response) => {
    const { name } = request.body;
    const db = dbService.getDbServiceInstance();
    
    const result = db.insertNewName(name);

    result
    .then(data => response.json({ data: data}))
    .catch(err => console.log(err));
});

// read
app.get('/getAll', (request, response) => {
    const db = dbService.getDbServiceInstance();

    const result = db.getAllData();
    
    result
    .then(data => response.json({data : data}))
    .catch(err => console.log(err));
})


////////////////
delete
app.delete('/delete/:id', (request, response) => {
    const { id } = request.params;
    const db = dbService.getDbServiceInstance();

    const result = db.deleteRowById(id);
    
    result
    .then(data => response.json({success : data}))
    .catch(err => console.log(err));
});

app.listen(3000, () => console.log('app is running'));





// var express = require("express");
// var app = express();
// var connection = require('./database');

// app.get('/', function(req, res) {
//     let sql = "SELECT * FROM docket.tasks ";
//     connection.query(sql, function(err, results){
//         if (err) throw err;
//         res.send(results);
//     });
// });

// app.listen(process.env.PORT, function(){
//     console.log('App Listening on port 3000');
//     connection.connect(function(err){
//         if(err) throw err;
//         console.log('Database connected!');
//     })
// });
