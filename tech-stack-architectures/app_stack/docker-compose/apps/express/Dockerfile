# Use the official Node.js image from Docker Hub
FROM node:latest

WORKDIR /usr/src/app

COPY demo_app/package*.json /usr/src/app/
RUN npm install

# Install PM2 globally to manage the process
RUN npm install pm2 -g

# Copy the rest of the application files
COPY demo_app /usr/src/app

# Start the app using PM2 and the ecosystem file in: Launching in no daemon mode
CMD ["pm2-runtime", "start", "ecosystem.config.js"]