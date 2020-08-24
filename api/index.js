const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const mysql = require('mysql');

//parse application/json
app.use(bodyParser.json());

//create database connection
const conn = mysql.createConnection({
	host: '75.114.200.67',
	port: '8999',
	user: 'jaredRemote',
	password: 'Command00',
	database: 'FederalAgencies'
});

//connect to database
conn.connect((err) =>{
	if(err) throw err;
	console.log(`MySQL database ${conn.database} @ ${conn.host}`);
});

//show all
app.get('/api/agencies',(req, res) => {
	let sql = "SELECT * FROM Agency";
	let query = conn.query(sql, (err, results) => {
		if (err) throw err;
	res.send(JSON.stringify(
		{
		"status":200,
		"error": null,
		"response": results
		}));

	});
});

//Server listening
app.listen(3121,()=>{
	console.log('Listening on port 3121...');
});

//http://mfikri.com/en/blog/nodejs-restful-api-mysql
