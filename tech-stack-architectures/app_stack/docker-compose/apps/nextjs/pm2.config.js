// pm2.config.js

module.exports = {
    apps: [{
      name: "nextjs-app",
      cwd: "demo_app",
      script: "npm",
      args: "start",
      instances: 1,         // Number of instances (1 for single instance, or use 'max' for all CPU cores)
      autorestart: true,    // Auto-restart if the app crashes
      watch: false,         // Disable file watching for changes
      max_memory_restart: "300M", // Restart if memory usage exceeds 300MB
      exec_mode: "cluster",
      env: {
        NODE_ENV: "production",
        DATABASE_URL: process.env.DATABASE_URL
      }
    }]
  };
  