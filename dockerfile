# Use the official Nginx image as the base image
FROM nginx:latest

# Copy the index.html to the default Nginx directory
COPY index.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]
