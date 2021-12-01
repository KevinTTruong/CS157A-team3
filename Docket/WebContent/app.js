const express = require('express');
const app = express();
const cors = require('cors');
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended : false }));

var connection = require('./database');

app.get('/getAll', function(req, res) {
    let sql = "SELECT * FROM docket.tasks ";
    connection.query(sql, function(err, results){
        if (err) throw err;
        res.send(results);
    });
});


// app.get('/insert', function(req, res) {
//     let sql = "INSERT INTO docket.task (title, description, start, end, className, icon) VALUES (?,?,?,?,?);";
//     connection.query(sql, function(err, results){
//         if (err) throw err;
//         res.send(results);
//     });
// });


app.listen(3000, function(){
    console.log('App Listening on port 3000');
    connection.connect(function(err){
        if(err) throw err;
        console.log('Database connected!');
    })
});
