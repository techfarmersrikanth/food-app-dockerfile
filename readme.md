# Build the Docker Image 
• Run the following command inside the project directory 
docker build -t food-app . 
• This command Builds your Docker image from the Dockerfile and names it food-app. 
 
# Run the Docker Container 
• This command starts a container that serves your web app and makes it accessible 
publicly via port 80 on your EC2. 
docker run -d -p 80:80 food-app

 Now The application is running inside a Docker container on port 80. 
#  Verify Image & Containers 
• Check all Docker images. 
docker images
Docker image food-app was built successfully with a final size of 48.3MB using dockerfile 
build. 
# Check running containers: 
docker ps

EC2 public IP. 
# Open your browser and visit http://<EC2-Public-IP> to access the running 
application.