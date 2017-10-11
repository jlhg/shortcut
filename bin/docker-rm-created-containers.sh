#!/bin/sh

docker ps -a | grep Created | cut -d ' ' -f 1 | xargs docker rm
