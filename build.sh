#!/bin/bash

docker build . -t warp-playground
docker run -v '${pwd}':/app/result warp-playground /bin/cp -r /app/out /app/result