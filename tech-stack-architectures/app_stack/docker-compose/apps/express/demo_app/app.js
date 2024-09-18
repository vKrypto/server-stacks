// app.js
const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

const promBundle = require("express-prom-bundle");

// Add the options to the prometheus middleware most option are for http_request_duration_seconds histogram metric
const metricsMiddleware = promBundle({
    metricsPath: "/prometheus/metrics",
    includeMethod: true, 
    includePath: true, 
    includeStatusCode: true, 
    includeUp: true,
    customLabels: {project_name: 'hello_world', project_type: 'test_metrics_labels'},
    promClient: {
        collectDefaultMetrics: {
        }
      }
});
// add the prometheus middleware to all routes
app.use(metricsMiddleware)

app.get('/', (req, res) => {
  res.send('Hello from the Express app!');
});

app.listen(PORT, () => {
  console.log(`Express app is running on port ${PORT}`);
});
