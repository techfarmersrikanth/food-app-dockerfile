# Use official lightweight Nginx image from Docker Hub
FROM nginx:1.25-alpine

# Set working directory (optional, just for clarity)
WORKDIR /usr/share/nginx/html

# Copy all files from current folder into the web server's root directory
COPY . .

# Expose port 80 to allow traffic
EXPOSE 80

# Start Nginx in the foreground (so Docker container keeps running)
yf  

