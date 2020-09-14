#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=feeziman007/capstone-docker-image-blue

# Step 2:
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD 
docker tag capstone-docker-image-blue $dockerpath

# Step 3:
# Push image to a docker repository
docker push $dockerpath:latest
