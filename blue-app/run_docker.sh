#!/usr/bin/env bash

# Step 1
# Build docker image
docker build -t capstone-docker-image-blue .

# Step 2
# List docker images
docker images

# Step 3
# Run docker app
docker run -d -p 3000:3000 --name capstone-docker-container-blue capstone-docker-image-blue