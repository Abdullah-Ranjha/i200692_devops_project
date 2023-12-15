#!/bin/bash

# Check if two arguments are passed
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <service-name> <new-tag>"
    exit 1
fi

SERVICE_NAME=$1
NEW_TAG=$2
DOCKER_COMPOSE_FILE="docker-compose.yml"

echo $SERVICE_NAME
echo $NEW_TAG

# Ensure docker-compose file exists
if [ ! -f "$DOCKER_COMPOSE_FILE" ]; then
    echo "Error: $DOCKER_COMPOSE_FILE not found."
    exit 1
fi

# Update the image tag for the given service
# This command searches for the image line of the specified service and replaces only the tag part
sed -i "s|\(image: abd444168/${SERVICE_NAME}:\).*|\1${NEW_TAG}|" $DOCKER_COMPOSE_FILE

# Check if the sed command was successful
if [ $? -eq 0 ]; then
    echo "Updated $DOCKER_COMPOSE_FILE with new image tag for $SERVICE_NAME."
else
    echo "Failed to update image tag for $SERVICE_NAME in $DOCKER_COMPOSE_FILE."
    exit 1
fi
