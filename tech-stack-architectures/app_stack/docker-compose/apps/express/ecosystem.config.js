module.exports = {
    apps: [
      {
        name: "express-app",  // Name of the application
        cwd: "demo_app",
        script: "./app.js",   // The entry point of your app
        instances: 1,         // Number of instances (1 for single instance, or use 'max' for all CPU cores)
        autorestart: true,    // Auto-restart if the app crashes
        watch: false,         // Disable file watching for changes
        max_memory_restart: "300M", // Restart if memory usage exceeds 300MB
        env: {
          NODE_ENV: "development",
          PORT: 3000           // Environment variables for development
        },
        env_production: {
          NODE_ENV: "production",
          PORT: 3000           // Environment variables for production
        }
      }
    ]
  };
  