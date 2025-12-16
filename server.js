// server.js
const express = require("express");
const path = require("path");
const dotenv = require("dotenv");
const apiRoutes = require("./api.js");

// Load .env
dotenv.config();

// Create app
const app = express();

// Middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// API Routes
app.use("/api", apiRoutes);

// HTML Routes
app.get(/^\/placestovisit(?:\.html)?$/, (req, res) => {
  res.sendFile(path.join(__dirname, "public", "placestovisit.html"));
});

app.get(/^\/events(?:\.html)?$/, (req, res) => {
  res.sendFile(path.join(__dirname, "public", "events.html"));
});

// Start Server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});
