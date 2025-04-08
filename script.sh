!/bin/bash

# This script builds a Docker image for a PostgreSQL database
docker build -t postgres-users-db .

# Runs the image in a container
docker run -d --name postgres-users-db -p 5432:5432 postgres-users-db