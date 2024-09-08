# Dockerfile

# Use the official Node.js image
FROM node:latest

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package.json /usr/src/app/
RUN npm install

# Copy the rest of the application files
COPY . /usr/src/app

# Build the Next.js app for production
RUN npm run build

# Expose the port Next.js will run on
EXPOSE 3000

# Start the app using PM2
CMD ["pm2-runtime", "start", "pm2.config.js"]
