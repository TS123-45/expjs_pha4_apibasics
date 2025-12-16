//working flow
//Create connection pool
//test connectivity
//Use query helper for SQL
//execution of sql queries

const express = require("express"); //to create routes
const mysql = require("mysql2"); //to talk to MySQL
const dotenv = require("dotenv"); //to read .env file

dotenv.config(); //dotenv.config() loads variables from your .env file into process.env.
//It must run before you create the pool or access any process.env.* values

const router = express.Router();

const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  connectionLimit: 10, //It is a group of 10 database connections kept open
});

// Query helper  This allows you to write SQL queries
const queryDatabase = (query, params = []) => {
  return new Promise((resolve, reject) => {
    pool.query(query, params, (err, results) => {
      if (err) reject(err);
      else resolve(results);
    });
  });
};

/* What query helper does?

Takes an SQL query string

Takes parameters (values)

Sends the query to MySQL

Gets results

Returns them using resolve()

If any error, returns using reject()

Because it returns a Promise, we can use async/await */

// Routes
/* Node.js is asynchronous
Database queries are asynchronous
async/await gives YOU the power to make it as synchronous */
router.get("/placeeestoooviiisiiit", async (req, res) => {
  try {
    const results = await queryDatabase("SELECT * FROM places_to_visit");
    res.json(results);
  } catch (err) {
    res
      .status(500)
      .json({ message: "Error retrieving places", error: err.message });
  }
});

router.get("/eventsss", async (req, res) => {
  try {
    const results = await queryDatabase("SELECT * FROM events");
    res.json(results);
  } catch (err) {
    res
      .status(500)
      .json({ message: "Error retrieving events", error: err.message });
  }
});

// Test route to check DB connection
router.get("/test-db", (req, res) => {
  pool.getConnection((err, connection) => {
    if (err) {
      res
        .status(500)
        .json({ message: "Database connection failed", error: err.message });
    } else {
      res.status(200).json({ message: "Database connected successfully!" });
      connection.release();
    }
  });
});

//pool.getConnection() tries to get one connection
//If MySQL is OK → success
//If MySQL is wrong → error
//connection.release() gives back the connection to the pool

module.exports = router;

/* Frontend sends request → /events

Backend responds via res.json(results)

Frontend JavaScript receives JSON using fetch() and response.json() 

Frontend prints/uses data */
