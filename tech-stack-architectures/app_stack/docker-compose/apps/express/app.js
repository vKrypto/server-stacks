// app.js
const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('Hello from the Express app!');
});

app.listen(PORT, () => {
  console.log(`Express app is running on port ${PORT}`);
});
