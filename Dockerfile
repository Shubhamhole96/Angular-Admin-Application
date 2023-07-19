# Use a base image with Node.js and npm installed
FROM node:14-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies using npm
RUN npm install

# Copy the rest of the application files to the working directory
COPY . .

# Build the Angular application
RUN npm run build --prod

# Use a lightweight web server to serve the built Angular app
FROM nginx:alpine

# Copy the built Angular app from the previous stage to the Nginx server directory
COPY --from=0 /app/dist/estore-admin-dashboard /usr/share/nginx/html

# Expose the port on which Nginx will listen (default is 80)
EXPOSE 80

# Start Nginx to serve the Angular app
CMD ["nginx", "-g", "daemon off;"]
