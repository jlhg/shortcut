#!/bin/sh
# Remove <none> images

docker rmi $(docker images -f "dangling=true" -q)
