var mysql = require("mysql");

var connection = mysql.createConnection({
    database: 'docket',
    user: 'root',
    password: 'M@dina2001'
});

module.exports = connection;