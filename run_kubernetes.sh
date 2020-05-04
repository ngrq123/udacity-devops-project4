#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath="ngrq123/udacity-devops-project4"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run udacity-devops-project4\
    --image=$dockerpath\
    --port=80\
    --labels app=udacity-devops-project4

# Step 3:
# List kubernetes pods
kubectl get pods --all-namespaces

# Step 4:
# Forward the container port to a host
kubectl port-forward udacity-devops-project4 8000:80

# Get logs
kubectl logs udacity-devops-project4
