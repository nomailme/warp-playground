#!/bin/bash

docker build . -t warp-playground:latest
docker run -v `pwd`:/app/result warp-playground:latest /bin/cp -r /app/out /app/result
docker rmi warp-playground:latest
