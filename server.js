require('dotenv').config();
const express= require('express');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();

app.use(cors());
app.use(express.json());

const db = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

// Test the Database Connection
db.getConnection((err, connection) => {
    if (err) {
        console.error(' Database connection failed:');
        if (err.code === 'PROTOCOL_CONNECTION_LOST') {
            console.error('Database connection was closed.');
        }
        if (err.code === 'ER_CON_COUNT_ERROR') {
            console.error('Database has too many connections.');
        }
        if (err.code === 'ECONNREFUSED') {
            console.error('Connection refused. (Is your MobaXterm tunnel running?)');
        }
        console.error(err.message);
    } else {
        console.log(' Successfully connected to the Feed The Fridge database!');
        connection.release(); // Return the connection to the pool
    }
});
app.listen(3000, () => {
    console.log('Server is running on port 3000');
})