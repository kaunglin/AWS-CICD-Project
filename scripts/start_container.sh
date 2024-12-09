#!/bin/bash
set -e

# Pull the Docker image from Docker Hub
docker pull sreedhar8897/hotel-app:latest

echo "Checking for existing container on port 80..."
existing_container=$(docker ps --filter "ancestor=sreedhar8897/hotel-app:latest" -q)

if [ -n "$existing_container" ]; then
  echo "Stopping existing container..."
  docker stop $existing_container
  echo "Removing existing container..."
  docker rm $existing_container
fi

# Run the Docker image as a container
docker run -dit -p 80:80 sreedhar8897/hotel-app