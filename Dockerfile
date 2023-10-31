# Node Block

# Build Stage
FROM node:alpine3.18 as builder

# Working Directory
WORKDIR /app

# Copy package.json and package-lock.json to the build environment
COPY package*.json /app

# Install development dependencies
RUN npm install

# Copy the rest of your application code
COPY . .

# Build your application (e.g., run a build script)
RUN npm run build

# Nginx Block

# Build Stage
FROM nginx:alpine3.18

# Nginx working directory
WORKDIR /usr/share/nginx/html

# Delete folder data
RUN rm -rf ./*

# Copy built files from the build stage to the production image
COPY --from=builder /app/build .

# Expose port 80 for the web server
EXPOSE 80

# Start the Nginx web server in the production image
CMD ["nginx", "-g", "daemon off;"]