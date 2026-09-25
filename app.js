const express = require("express");

const app = express();
const PORT = process.env.PORT || 3000;

app.get("/", (req, res) => {
    res.send("CloudOps Node.js Application is Running!");
});

app.get("/health", (req, res) => {
    res.json({
        status: "healthy",
        message: "Application is working"
    });
});

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});