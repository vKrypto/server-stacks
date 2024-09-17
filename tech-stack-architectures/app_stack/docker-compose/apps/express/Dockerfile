# Dockerfile

# Use the official Node.js image from Docker Hub
FROM node:latest

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package.json /usr/src/app/
RUN npm install

# Copy the rest of the application files
COPY . /usr/src/app

# Start the app using PM2 and the ecosystem file
CMD ["pm2-runtime", "start", "ecosystem.config.js"]
