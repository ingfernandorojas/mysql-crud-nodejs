const mysql = require('mysql');
const express = require('express');
var app = express();
const bodyparser = require('body-parser');

app.use(bodyparser.json());

var mysqlConnection = mysql.createConnection({
    localhost: 'localhost',
    user: 'root',
    password: '**********',
    database: 'employee',
    multipleStatements: true
});

mysqlConnection.connect((err)=> {
    if(!err)
        console.log('Successful connection');
    else
        console.log('Failed connection\nError: '+JSON.stringify(err, undefined, 2));
});

app.listen(3000, ()=>{
    console.log('Express server is running at port number: 3000')
});

// Get all employees
app.get('/employees', (req,res)=>{
    mysqlConnection.query('SELECT * FROM employees', (err,rows,fields)=>{
        if(!err)
            res.send(rows);
        else
            console.log(err);
    });
});

// Get an employee
app.get('/employees/:id', (req,res)=>{
    mysqlConnection.query('SELECT * FROM employees WHERE EmpID = ?',[req.params.id], 
    (err,rows,fields)=>{
        if(!err)
            res.send(rows);
        else
            console.log(err);
    });
});

// Insert an employee
app.post('/employees', (req,res)=>{
    let emp = req.body;
    var sql = "SET @EmpID = ?; SET @Name = ?; SET @EmpCode = ?; SET @Salary = ?;\
     CALL employeeAddOrEdit(@EmpID,@Name,@EmpCode,@Salary);";
    mysqlConnection.query(sql, [emp.EmpID,emp.Name,emp.EmpCode,emp.Salary],
    (err,rows,fields)=>{
        if(!err)
            rows.forEach(element => {
                if(element.constructor == Array)
                    res.send(JSON.stringify(element[0].EmpID));

            });
        else
            console.log(err);
    });
});

// Update an employee
app.put('/employees', (req,res)=>{
    let emp = req.body;
    var sql = "SET @EmpID = ?; SET @Name = ?; SET @EmpCode = ?; SET @Salary = ?;\
     CALL employeeAddOrEdit(@EmpID,@Name,@EmpCode,@Salary);";
    mysqlConnection.query(sql, [emp.EmpID,emp.Name,emp.EmpCode,emp.Salary],
    (err,rows,fields)=>{
        if(!err)
            res.send('Updated successfully');
        else
            console.log(err);
    });
});

// Delete an employee
app.delete('/employees/:id', (req,res)=>{
    mysqlConnection.query('DELETE FROM employees WHERE EmpID = ?',[req.params.id], 
    (err,rows,fields)=>{
        if(!err)
            res.send('Deleted successfully');
        else
            console.log(err);
    });
});
