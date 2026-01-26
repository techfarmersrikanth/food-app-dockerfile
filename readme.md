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

# to access get EC2 public IP. 
Open your browser and visit http://<EC2-Public-IP> to access the running 
application.

# Setting up pvt docker registry using docker compose 

- sudo apt-get update
- sudo apt-get install docker-compose-plugin
- sudo apt  install docker-compose


- mkdir docker-registry-frontend
- cd docker-registry-frontend
---
- vi docker-compose.yml
version: '3'
services:
  registry:
    image: registry:2
    container_name: registry
    ports:
      - "5000:5000"
    volumes:
      - ./data:/var/lib/registry
  registry-frontend:
    image: konradkleine/docker-registry-frontend:v2
    container_name: registry-frontend
    ports:
      - "8080:80"
    environment:
      - ENV_DOCKER_REGISTRY_HOST=registry
      - ENV_DOCKER_REGISTRY_PORT=5000
    depends_on:
      - registry
      

- docker-compose up -d

- Docker Registry (API):
http://localhost:5000/v2/_catalog
- Registry Frontend UI:
http://localhost:8080---------------

# Push an Image

- docker pull alpine
- docker tag alpine localhost:5000/my-alpine
- docker push localhost:5000/my-alpine

# if incase of issue in pushing the image do below
- Then refresh http://localhost:8080 to see the image listed.
⚠ Optional: Allow Insecure Registry (For Local Only)
If pushing fails due to insecure registry, on Linux edit:
---
- sudo vi /etc/docker/daemon.json
- Add:
- {
"insecure-registries": ["localhost:5000"]
}

---
- Then restart Docker:
sudo systemctl restart 
