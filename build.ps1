docker build . -t warp-playground
$location = Get-Location
docker run -v $location`:`/app/result warp-playground /bin/cp -r /app/out /app/result