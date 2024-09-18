# Dockerfile

# Use the official Node.js image
FROM node:latest

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY demo_app/package.json /usr/src/app/
RUN npm install

# Install PM2 globally to manage the process
RUN npm install pm2 -g

# Copy the rest of the application files
COPY demo_app /usr/src/app

# Build the Next.js app for production
RUN npm run build

# Start the app using PM2
CMD ["pm2-runtime", "start", "pm2.config.js"]
