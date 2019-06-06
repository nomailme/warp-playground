docker build . -t warp-playground:latest
$location = Get-Location
docker run -v $location`:`/app/result warp-playground:latest /bin/cp -r /app/out /app/result
docker rmi warp-playground:latest