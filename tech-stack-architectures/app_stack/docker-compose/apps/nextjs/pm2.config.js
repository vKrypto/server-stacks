// pm2.config.js

module.exports = {
    apps: [{
      name: "nextjs-app",
      script: "npm",
      args: "start",
      instances: "max",  // Utilize all CPU cores
      exec_mode: "cluster",
      env: {
        NODE_ENV: "production",
        DATABASE_URL: process.env.DATABASE_URL
      }
    }]
  };
  