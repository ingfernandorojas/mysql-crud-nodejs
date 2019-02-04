## Clonar el repositorio
```git clone https://github.com/ingfernandorojas/mysql-crud-nodejs.git```

## Ubicarse en el directorio
```cd mysql-crud-nodejs```

## Instalar paquetes
```npm install package.json```

## Crear la base de datos employee
 ```mysql -u root -p```
 ```CREATE DATABASE employee;```
 ```USE employee;```
 ```source employee.sql;```
 
 ## Modificar index.js
 
 ```
 var mysqlConnection = mysql.createConnection({
    localhost: 'localhost',
    user: 'root',
    password: '**********',
    database: 'employee',
    multipleStatements: true
});
```
## Iniciar servidor

``` node index.js```

## Abrir postman o aplicación similar e insertar datos

POST: http://localhost:3000/employees/

Body JSON(application/json) Agregar los siguientes datos y send
```
{
"EmpID": 0,
"Name": "Fernando Rojas",
"EmpCode": "Emp01",
"Salary": 4500
}
```

## Obtener todos los datos

GET: http://localhost:3000/employees/


## Obtener los datos de un empleado

GET: http://localhost:3000/employees/EmpID

## Modificar datos

PUT: http://localhost:3000/employees/
Body JSON(application/json) Agregar los siguientes datos y send
```
{
"EmpID": Aquí va el codigo del empleado,
"Name": "Fernando Rojas",
"EmpCode": "Emp01",
"Salary": 4500
}
```
## Eliminar datos

DELETE: http://localhost:3000/employees/EmpID

