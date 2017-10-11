#!/bin/sh

docker ps -a | grep Exited | cut -d ' ' -f 1 | xargs docker rm
