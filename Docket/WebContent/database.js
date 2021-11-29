// var mysql = require("mysql");

// var connection = mysql.createConnection({
//     // database: 'docket',
//     // user: 'root',
//     // password: 'M@dina2001'
//     user: 'root',
//     password: 'M@dina2001',
//     database: 'docket',
// });

// // module.exports = connection;
// connection.connect((err) => {
//     if (err) {
//         console.log(err.message);
//     }
// });

// class DbService {
//     static getDbServiceInstance() {
//         return instance ? instance : new DbService();
//     }

//     async getAllData() {
//         try {
//             const response = await new Promise((resolve, reject) => {
//                 const query = "SELECT * FROM docket.task;";

//                 connection.query(query, (err, results) => {
//                     if (err) reject(new Error(err.message));
//                     resolve(results);
//                 })
//             });
//             // console.log(response);
//             return response;
//         } catch (error) {
//             console.log(error);
//         }
//     }


//     async insertNewName(name) {
//         try {
//             const dateAdded = new Date();
//             const insertId = await new Promise((resolve, reject) => {
//                 const query = "INSERT INTO docket.task (id, name, date_added) VALUES (?,?,?);";

//                 connection.query(query, [name, dateAdded] , (err, result) => {
//                     if (err) reject(new Error(err.message));
//                     resolve(result.insertId);
//                 })
//             });
//             return {
//                 id : insertId,
//                 name : name,
//                 dateAdded : dateAdded
//             };
//         } catch (error) {
//             console.log(error);
//         }
//     }

//     // async deleteRowById(id) {
//     //     try {
//     //         id = parseInt(id, 10); 
//     //         const response = await new Promise((resolve, reject) => {
//     //             const query = "DELETE FROM docket.task WHERE id = ?";
    
//     //             connection.query(query, [id] , (err, result) => {
//     //                 if (err) reject(new Error(err.message));
//     //                 resolve(result.affectedRows);
//     //             })
//     //         });
    
//     //         return response === 1 ? true : false;
//     //     } catch (error) {
//     //         console.log(error);
//     //         return false;
//     //     }
//     // }

//     // async updateNameById(id, name) {
//     //     try {
//     //         id = parseInt(id, 10); 
//     //         const response = await new Promise((resolve, reject) => {
//     //             const query = "UPDATE names SET name = ? WHERE id = ?";
    
//     //             connection.query(query, [name, id] , (err, result) => {
//     //                 if (err) reject(new Error(err.message));
//     //                 resolve(result.affectedRows);
//     //             })
//     //         });
    
//     //         return response === 1 ? true : false;
//     //     } catch (error) {
//     //         console.log(error);
//     //         return false;
//     //     }
//     // }

//     // async searchByName(name) {
//     //     try {
//     //         const response = await new Promise((resolve, reject) => {
//     //             const query = "SELECT * FROM names WHERE name = ?;";

//     //             connection.query(query, [name], (err, results) => {
//     //                 if (err) reject(new Error(err.message));
//     //                 resolve(results);
//     //             })
//     //         });

//     //         return response;
//     //     } catch (error) {
//     //         console.log(error);
//     //     }
//     // }
// }

// module.exports = DbService;

     
var mysql = require("mysql");

var connection = mysql.createConnection({
    database: 'docket',
    user: 'root',
    password: 'M@dina2001'
});

module.exports = connection;