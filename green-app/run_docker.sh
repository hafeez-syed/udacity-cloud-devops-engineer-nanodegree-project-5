#!/usr/bin/env bash

# Step 1
# Build docker image
docker build -t capstone-docker-image-green .

# Step 2
# List docker images
docker images

# Step 3
# Run docker app
docker run -d -p 4000:4000 --name capstone-docker-container-green capstone-docker-image-green